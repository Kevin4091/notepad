import 'package:flutter/material.dart';
import 'package:notepad/view/splash_screen/note_screen/widget/customnotewidget.dart';

class NoteScreen extends StatelessWidget {
  const NoteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        elevation: 0,
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: const Text(
          'Notes',
          style: TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => const CustomNoteWidget(),
                  separatorBuilder: (context, index) => const SizedBox(
                        height: 10,
                      ),
                  itemCount: 2)
            ],
          ),
        ),
      ),
    );
  }
}
