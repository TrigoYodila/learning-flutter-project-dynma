import 'package:first_project/models/activity_model.dart';
import 'package:first_project/providers/city_provider.dart';
import 'package:first_project/views/activity_form/widgets/activity_form_image_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ActivityForm extends StatefulWidget {
  final String cityName;
  const ActivityForm({super.key, required this.cityName});

  @override
  State<ActivityForm> createState() => _ActivityFormState();
}

class _ActivityFormState extends State<ActivityForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late FocusNode _priceFocusNode;
  late FocusNode _urlFocusNode;
  late FocusNode _addressFocusNode;
  late Activity _newActivity;
  late String _nameInputAsync;
    final TextEditingController _urlController = TextEditingController();
  bool _isLoading = false;

  FormState get form {
    return _formKey.currentState!;
  }

  @override
  void initState() {
    _newActivity = Activity(
      city: widget.cityName,
      name: '',
      price: 0,
      image: '',
      location: LocationActivity(
        address: null,
        longitude: null,
        latitude: null
      ),
      status: ActivityStatus.ongoing,
    );
    _priceFocusNode = FocusNode();
    _urlFocusNode = FocusNode();
    _addressFocusNode = FocusNode();
    _addressFocusNode.addListener((){

    });
    super.initState();
  }

  void updateUrlField(String url) {
    setState(() {
      _urlController.text = url;
    });
  }

  Future<void> submitForm() async {
    try {
      CityProvider cityProvider = Provider.of<CityProvider>(context, listen: false);
      _formKey.currentState!.save();
      setState(() => _isLoading = true);
      _nameInputAsync = await cityProvider.verifyIfActivityNameIsUnique(widget.cityName, _newActivity.name); // transformer une validation asynchrone en validation synchrone
      if (form.validate()) {
        await Provider.of<CityProvider>(
          context,
          listen: false,
        ).addActivityToCity(_newActivity);
        setState(() => _isLoading = false);
        Navigator.pop(context);
      }else{
        setState(() => _isLoading = false);
      }
    } catch (e) {
      setState(() => _isLoading = false);
      print('error');
    }
  }

  @override
  void dispose() {
    _priceFocusNode.dispose();
    _urlFocusNode.dispose();
    _addressFocusNode.dispose();
    _urlController.dispose();
    super.dispose();
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
              decoration: InputDecoration(
                labelText: 'Nom',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Remplissez le nom';
                }
                else if (_nameInputAsync != null){
                  return _nameInputAsync; // validation synchrone
                }
                return null;
              },
              onSaved: (value) => _newActivity.name = value!,
              onFieldSubmitted: (_) =>
                  FocusScope.of(context).requestFocus(_priceFocusNode),
              textInputAction: TextInputAction.next,
            ),
            SizedBox(
              height: 30,
            ),
            TextFormField(
              keyboardType: TextInputType.number,
              focusNode: _priceFocusNode,
              decoration: InputDecoration(
                hintText: 'Prix',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Remplissez le prix';
                }
                return null;
              },
              onSaved: (value) => _newActivity.price = double.parse(value.toString()),
              onFieldSubmitted: (_) =>
                  FocusScope.of(context).requestFocus(_urlFocusNode),
              textInputAction: TextInputAction.next,
            ),
            SizedBox(
              height: 30,
            ),
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Adresse'
              ),
              onSaved: (value) => _newActivity.location!.address,
            ),
            SizedBox(
              height: 30,
            ),
            TextFormField(
              keyboardType: TextInputType.url,
              focusNode: _urlFocusNode,
              controller: _urlController,
              decoration: InputDecoration(
                hintText: 'Url image',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Remplissez l\'Url';
                }
                return null;
              },
              onSaved: (value) => _newActivity.image = value!,
            ),
            SizedBox(
              height: 30,
            ),
            ActivityFormImagePicker(updateUrl: updateUrlField),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                TextButton(
                  child: Text('annuler'),
                  onPressed: () => Navigator.pop(context),
                ),
                ElevatedButton(
                  child: Text('sauvegarder'),
                  onPressed: _isLoading ? null : submitForm,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}