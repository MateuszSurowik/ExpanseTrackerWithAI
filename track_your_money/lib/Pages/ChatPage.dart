import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:track_your_money/KeyGPT/openai_service.dart';
import 'package:track_your_money/main.dart';
import 'package:flutter_tts/flutter_tts.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  String generatedContent = 'Ask me something';
  final _speechToText = SpeechToText();
  final flutterTts = FlutterTts();
  String lastWord = '';
  final OpenAIService GPT = OpenAIService();
  int start = 200;
  int delay = 200;

  @override
  void initState() {
    super.initState();
    initSpeechToText();
    initTextToSpeech();
  }

  Future<void> initTextToSpeech() async {
    await flutterTts.setSharedInstance(true);
    setState(() {});
  }

  Future<void> initSpeechToText() async {
    await _speechToText.initialize();
    setState(() {});
  }

  Future<void> _startListening() async {
    await _speechToText.listen(onResult: onSpeechResult);
    setState(() {});
  }

  Future<void> _stopListening() async {
    await _speechToText.stop();
    setState(() {});
  }

  void onSpeechResult(SpeechRecognitionResult result) {
    setState(() {
      lastWord = result.recognizedWords;
    });
  }

  Future<void> systemSpeak(String content) async {
    await flutterTts.speak(content);
  }

  @override
  void dispose() {
    super.dispose();
    _speechToText.stop();
    flutterTts.stop();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppBar(
          centerTitle: true,
          title: Text(
            "Your Voice Assistant",
          ),
          backgroundColor: Color.fromARGB(255, 141, 206, 129),
          elevation: 8,
          shadowColor: kColor.primary,
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Container(
              alignment: Alignment.center,
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 141, 206, 129).withOpacity(0.8),
                  border: Border.all(
                    style: BorderStyle.solid,
                  ),
                  borderRadius: BorderRadius.circular(50),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      offset: Offset(0, 2),
                      blurRadius: 2,
                      spreadRadius: 1,
                    )
                  ]),
              child: Text(generatedContent),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () async {
                  if (await _speechToText.hasPermission &&
                      _speechToText.isNotListening) {
                    await _startListening();
                  } else {
                    initSpeechToText();
                  }
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: kColor.primary,
                    shape: CircleBorder(),
                    minimumSize: Size(75, 75)),
                child: Icon(Icons.mic),
              ),
              SizedBox(
                width: 40,
              ),
              ElevatedButton(
                onPressed: () async {
                  if (_speechToText.isListening) {
                    final speech = await GPT.gptPrompt(lastWord);
                    await _stopListening();
                    generatedContent = speech;
                    setState(() {});
                    await systemSpeak(speech);
                  }
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: kColor.primary,
                    shape: CircleBorder(),
                    minimumSize: Size(75, 75)),
                child: Icon(Icons.stop),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
