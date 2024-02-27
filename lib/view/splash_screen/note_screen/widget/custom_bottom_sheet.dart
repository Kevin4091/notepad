import 'package:flutter/material.dart';
import 'package:notepad/controller/note_screen_controller.dart';
import 'package:notepad/utils/constants/color_constant.dart';

class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet({
    super.key,
    this.onSavePressed,
  });

  final void Function()? onSavePressed;

  @override
  Widget build(BuildContext context) {
    List colorsList = [
      ColorConstants.redNote,
      ColorConstants.blueNote,
      ColorConstants.greenNote,
      ColorConstants.yellowNote,
    ];

    int selectedColorIndex = 0;

    return StatefulBuilder(
      builder: (context, bottomSetState) => Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Container(
          decoration: const BoxDecoration(
            color: ColorConstants.mainDarkGrey,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(20),
            ),
          ),
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 15),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: NoteScreenController.titleController,
                decoration: const InputDecoration(
                    label: Text("Title"),
                    border: OutlineInputBorder(),
                    fillColor: ColorConstants.mainLightGrey,
                    filled: true),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: NoteScreenController.desController,
                decoration: const InputDecoration(
                    label: Text("Description"),
                    border: OutlineInputBorder(),
                    fillColor: ColorConstants.mainLightGrey,
                    filled: true),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: NoteScreenController.dateController,
                decoration: const InputDecoration(
                    label: Text("Date"),
                    border: OutlineInputBorder(),
                    fillColor: ColorConstants.mainLightGrey,
                    filled: true),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 60,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: 4,
                  itemBuilder: (context, index) => InkWell(
                    onTap: () {
                      var obj = NoteScreenController();

                      selectedColorIndex = index;

                      obj.onColorSelection(colorsList[selectedColorIndex]);
                      bottomSetState(() {});
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: selectedColorIndex == index
                            ? Border.all(
                                width: 2, color: ColorConstants.mainRed)
                            : null,
                        color: colorsList[index],
                      ),
                      width: 60,
                    ),
                  ),
                  separatorBuilder: (context, index) => const SizedBox(
                    width: 10,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        NoteScreenController.clearControllers();

                        Navigator.pop(context);

                        // bottomSetState(() {});
                      },
                      child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: ColorConstants.mainLightGrey,
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 15,
                          ),
                          child: const Center(child: Text("Cancel"))),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: onSavePressed,
                      child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: ColorConstants.mainLightGrey,
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 15,
                          ),
                          child: const Center(child: Text("Save"))),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
