import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

void main() {
  runApp(AIImageGeneratorApp());
}

class AIImageGeneratorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AIImageGeneratorScreen(),
    );
  }
}

class AIImageGeneratorScreen extends StatefulWidget {
  @override
  _AIImageGeneratorScreenState createState() => _AIImageGeneratorScreenState();
}

class _AIImageGeneratorScreenState extends State<AIImageGeneratorScreen> {
  final TextEditingController _controller = TextEditingController();
  List<String> _imageUrls = [];
  String _errorMessage = "";
  bool _isLoading = false;
  bool _isProcessing = false;
  String _statusUrl = "";
  Timer? _statusCheckTimer;

  Future<void> generateImage(String prompt) async {
    final url = Uri.parse('https://api.monsterapi.ai/v1/generate/sdxl-base');
    final apiKey =
        'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VybmFtZSI6ImJlNDJkMWFjMDczM2U0YzEzMzYzYWYxNGQ2NTcyNzljIiwiY3JlYXRlZF9hdCI6IjIwMjQtMDktMTJUMDc6MTM6MjUuMjU2NzM5In0.tjA4F6cDgBPvrZIS6FtrGNQmx6JIlL6QTdNFAjgqsss'; // Replace with your Monster API Key

    setState(() {
      _isLoading = true;
      _errorMessage = ''; // Reset the error message
      _isProcessing = false;
    });

    try {
      final response = await http.post(
        url,
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $apiKey',
        },
        body: jsonEncode({
          'prompt': prompt,
          'safe_filter': true,
        }),
      );

      // Print the raw response for debugging
      print('Response Status: ${response.statusCode}');
      print('Response Body: ${response.body}');

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        setState(() {
          _statusUrl = responseData['status_url'] ?? '';
          _isProcessing = true;
        });
        _startStatusPolling();
      } else {
        final errorResponse = jsonDecode(response.body);
        setState(() {
          _errorMessage =
              errorResponse['error']['message'] ?? 'Failed to generate image.';
        });
      }
    } catch (e) {
      setState(() {
        _errorMessage = 'An error occurred: $e';
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> _startStatusPolling() async {
    const pollingInterval = Duration(seconds: 6); // Poll every 5 seconds

    _statusCheckTimer = Timer.periodic(pollingInterval, (timer) async {
      final statusResponse = await http.get(
        Uri.parse(_statusUrl),
        headers: {
          'Accept': 'application/json',
          'Authorization':
              'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VybmFtZSI6ImJlNDJkMWFjMDczM2U0YzEzMzYzYWYxNGQ2NTcyNzljIiwiY3JlYXRlZF9hdCI6IjIwMjQtMDktMTJUMDc6MTM6MjUuMjU2NzM5In0.tjA4F6cDgBPvrZIS6FtrGNQmx6JIlL6QTdNFAjgqsss', // Use your API Key
        },
      );

      print('Status Response Status: ${statusResponse.statusCode}');
      print('Status Response Body: ${statusResponse.body}');

      if (statusResponse.statusCode == 200) {
        final statusData = jsonDecode(statusResponse.body);
        if (statusData['status'] == 'COMPLETED') {
          setState(() {
            _imageUrls =
                List<String>.from(statusData['result']['output'] ?? []);
            _isProcessing = false;
          });
          timer.cancel(); // Stop polling once the image is ready
        } else if (statusData['status'] == 'FAILED') {
          setState(() {
            _errorMessage = 'Image generation failed.';
            _isProcessing = false;
          });
          timer.cancel(); // Stop polling on failure
        }
      }
    });
  }

  @override
  void dispose() {
    _statusCheckTimer?.cancel(); // Cancel timer when widget is disposed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AI Image Generator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter a prompt',
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                final prompt = _controller.text;
                if (prompt.isNotEmpty) {
                  generateImage(prompt);
                }
              },
              child: Text('Generate Image'),
            ),
            SizedBox(height: 16),
            _isLoading
                ? Center(child: CircularProgressIndicator())
                : _isProcessing
                    ? Center(
                        child:
                            CircularProgressIndicator()) // Loader while processing
                    : _imageUrls.isNotEmpty
                        ? Column(
                            children: _imageUrls
                                .map((url) => Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 8.0),
                                      child: Image.network(url),
                                    ))
                                .toList(),
                          )
                        : _errorMessage.isNotEmpty
                            ? Text(
                                _errorMessage,
                                style: TextStyle(color: Colors.red),
                              )
                            : Text('Enter a prompt to generate an image'),
          ],
        ),
      ),
    );
  }
}
