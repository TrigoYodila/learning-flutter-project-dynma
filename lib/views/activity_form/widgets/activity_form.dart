import 'package:first_project/models/activity_model.dart';
import 'package:flutter/material.dart';

class ActivityForm extends StatefulWidget {
  final String cityName;
  const ActivityForm({super.key, required this.cityName});

  @override
  State<ActivityForm> createState() => _ActivityFormState();
}

class _ActivityFormState extends State<ActivityForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late FocusNode _priceFocusNode;  // attribut privé
  late FocusNode _urlFocusNode;
  late Activity newActivity;
  FormState? get form {
    return _formKey.currentState;
  }

  @override
  void initState() {
    newActivity = Activity(
      name: widget.cityName, 
      city: '', 
      image: '', 
      price: 0,
      status: ActivityStatus.ongoing
    );
    _priceFocusNode = FocusNode();
    _urlFocusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    _urlFocusNode.dispose();
    _priceFocusNode.dispose();
    super.dispose();
  }

  void submitForm(){
    if(form?.validate() ?? false){
      form?.save();
    } else {
      print('error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      child: Form(
        key: _formKey,
      child: Column(
        children: <Widget>[
          TextFormField(
            autofocus: true,
            validator: (value){
              if(value!.isEmpty) return 'Remplissez le Nom';
              return null;
            }, 
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              // hintText: 'Nom'
              labelText: 'Nom'
            ),
            onSaved: (value) => newActivity.name = value.toString(),
             onFieldSubmitted: (_) => FocusScope.of(context).requestFocus(_priceFocusNode),
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            keyboardType: TextInputType.number,
            validator: (value){
              if(value!.isEmpty) return 'Remplissez le Prix';
              return null;
            },
            focusNode: _priceFocusNode, 
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              hintText: 'Prix'
            ),
            onSaved: (value) => newActivity.price = double.parse(value.toString()),
            onFieldSubmitted: (_) => FocusScope.of(context).requestFocus(_urlFocusNode),
          ),
          TextFormField(
             keyboardType: TextInputType.url,
            validator: (value){
              if(value!.isEmpty) return 'Remplissez l\'Url';
              return null;
            }, 
            onFieldSubmitted: (_) => submitForm,
            focusNode:_urlFocusNode,
            decoration: InputDecoration(
              hintText: 'Url Image'
            ),
            onSaved: (value) => newActivity.image = value.toString(),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              ElevatedButton(onPressed: () => Navigator.pop(context), child: Text('Annuler')),
              ElevatedButton(onPressed: submitForm , child: Text('Sauvegarder'))
            ],
          )
        ],
      )
    ),
    );
  }
}