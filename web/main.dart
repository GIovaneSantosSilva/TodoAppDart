import 'dart:html';
import './lib/app.dart';

void main() {
	App(
		querySelector('#list'),
		querySelector('#modal'),
		querySelector('.modal'),
		querySelector('#title'),
		querySelector('#desc'),
		querySelector('#add'),
		querySelector('#save')
	);
} 