import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:provider/provider.dart';

import '../modele/task.dart';
import '../viewmodel/task_view_model.dart';

class modifyTask extends StatefulWidget {
  final Task task;
  const modifyTask({super.key, required this.task});

  @override
  State<modifyTask> createState() => modifyTaskState();
}

class modifyTaskState extends State<modifyTask>{
  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update Task'),
      ),
      body: Center(
        child: FormBuilder(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                FormBuilderTextField(name: 'title', initialValue: widget.task.title, decoration: const InputDecoration(labelText: 'Titre de la tâche'),
                  validator: FormBuilderValidators.compose([FormBuilderValidators.required()]),
                ),
                FormBuilderTextField(name: 'description', initialValue: widget.task.description, decoration: const InputDecoration(labelText: 'Description de la tâche'),
                  validator: FormBuilderValidators.compose([FormBuilderValidators.required()]),
                ),
                FormBuilderTextField(name: 'tags', initialValue: widget.task.tags.toString(), decoration: const InputDecoration(labelText: 'Tags associés de la tâche'),
                  validator: FormBuilderValidators.compose([FormBuilderValidators.required()]),
                ),
                FormBuilderTextField(name: 'difficulty', initialValue: widget.task.difficulty.toString(), decoration: const InputDecoration(labelText: 'Difficulté de la tâche'),
                  validator: FormBuilderValidators.compose([FormBuilderValidators.required()]),
                ),
                FormBuilderTextField(name: 'nbhours', initialValue: widget.task.nbhours.toString(), decoration: const InputDecoration(labelText: 'Nb heures de la tache'),
                  validator: FormBuilderValidators.compose([FormBuilderValidators.required()]),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black,
                    backgroundColor: Colors.lightBlue,
                  ),
                  onPressed: (){
                    if (_formKey.currentState!.validate()){
                      context.read<TaskViewModel>().editTask(
                          widget.task,
                          _formKey.currentState?.fields['title']?.value,
                          _formKey.currentState?.fields['tags']?.value,
                          int.parse(_formKey.currentState?.fields['nbhours']?.value),
                          int.parse(_formKey.currentState?.fields['difficulty']?.value),
                          _formKey.currentState?.fields['description']?.value);
                      Navigator.pop(context);
                    }
                  },
                  child: const Text('Update'),
                )
              ],
            )
        ),
      ),
    );
  }
}