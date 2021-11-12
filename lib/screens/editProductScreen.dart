import 'package:flutter/material.dart';
import 'package:myshop/providers/products.dart';
import '../providers/product.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class EditProductScreen extends StatefulWidget {
  static const namedRoute = '/editProduct';

  @override
  _EditProductScreenState createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
  final _imageUrlController = TextEditingController();
  final _form = GlobalKey<FormState>();

  var _isInit = true;
  var _initValues = {
    'title': '',
    'description': '',
    'price': '',
    'imageUrl': ''
  };
  var _editedProduct =
      Product(title: '', id: null, price: 0, description: '', imageUrl: '');
  @override
  void didChangeDependencies() {
    if (_isInit) {
      final productId = ModalRoute.of(context).settings.arguments as String;
      if (productId != null) {
        _editedProduct = Provider.of<Products>(context).findById(productId);
        _initValues = {
          'title': _editedProduct.title,
          'description': _editedProduct.description,
          'price': _editedProduct.price.toString(),
          'imageUrl': '',
        };
        _imageUrlController.text = _editedProduct.imageUrl;
      }
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  void _saveForm() {
    final isValid = _form.currentState.validate();
    if (!isValid) {
      return;
    }
    _form.currentState.save();
    if(_editedProduct.id != null){
    Provider.of<Products>(context, listen: false).updateProduct(_editedProduct.id, _editedProduct);
    }else{
    Provider.of<Products>(context, listen: false).addProduct(_editedProduct);
    }
    
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Product'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.save), onPressed: _saveForm),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _form,
          child: ListView(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(labelText: 'Title'),
                initialValue: _initValues['title'],
                textInputAction: TextInputAction.next,
                onSaved: (value) {
                  _editedProduct = Product(
                      title: value,
                      id: _editedProduct.id,
                      price: _editedProduct.price,
                      description: _editedProduct.description,
                      imageUrl: _editedProduct.imageUrl,
                      isFavourite: _editedProduct.isFavourite);
                },
                validator: (value) {
                  if (value.isEmpty) {
                    return 'title is required';
                  }
                  return null;
                },
              ),
              TextFormField(
                initialValue: _initValues['price'],
                decoration: InputDecoration(labelText: 'Price'),
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.number,
                onSaved: (value) {
                  _editedProduct = Product(
                      title: _editedProduct.title,
                      id: _editedProduct.id,
                      price: double.parse(value),
                      description: _editedProduct.description,
                      imageUrl: _editedProduct.imageUrl,
                      isFavourite: _editedProduct.isFavourite);
                },
                validator: (value) {
                  if (value.isEmpty) {
                    return 'price is required';
                  }
                  if (double.tryParse(value) == null) {
                    return 'enter the valid price';
                  }
                  if (double.parse(value) <= 0) {
                    return 'the price must  be  greater than  0';
                  }
                  return null;
                },
              ),
              TextFormField(
                initialValue: _initValues['description'],
                decoration: InputDecoration(labelText: 'Description'),
                maxLines: 3,
                keyboardType: TextInputType.multiline,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'description is required';
                  }
                  if (value.length < 10) {
                    return 'should bea at least 10 characters';
                  }
                },
                onSaved: (value) {
                  _editedProduct = Product(
                      title: _editedProduct.title,
                      id: _editedProduct.id,
                      price: _editedProduct.price,
                      description: value,
                      imageUrl: _editedProduct.imageUrl,
                      isFavourite: _editedProduct.isFavourite);
                },
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Container(
                    height: 100,
                    width: 100,
                    margin: EdgeInsets.only(top: 8, right: 10),
                    decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.grey)),
                    child: _imageUrlController.text.isEmpty
                        ? Text('Enter the URL')
                        : FittedBox(
                            child: Image.network(_imageUrlController.text),
                            fit: BoxFit.cover,
                          ),
                  ),
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(labelText: 'Image URL'),
                      keyboardType: TextInputType.url,
                      textInputAction: TextInputAction.done,
                      controller: _imageUrlController,
                      onFieldSubmitted: (_) {
                        _saveForm();
                      },
                      validator: (Value) {
                        if (Value.isEmpty) {
                          return 'imageUrl is required';
                        }
                        if (!Value.startsWith('http') &&
                            !Value.startsWith('https')) {
                          return 'enter the valid url.';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _editedProduct = Product(
                            title: _editedProduct.title,
                            id: _editedProduct.id,
                            price: _editedProduct.price,
                            description: _editedProduct.description,
                            imageUrl: value,
                            isFavourite: _editedProduct.isFavourite);
                      },
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
