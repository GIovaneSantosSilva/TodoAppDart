import 'dart:html';
import './todo.dart';
import './utils.dart';

class App {

	int _id = 0;

	final DivElement _list;
	final DivElement _modal;
	final DivElement _modalShow;
	final InputElement _inputTitle;
	final InputElement _inputDesc;
	final ButtonElement _buttonAdd;
	final ButtonElement _buttonSave;

	final List<Todo> _todoList = [];

	App(
		this._list, 
		this._modal, 
		this._modalShow,
		this._inputTitle,
		this._inputDesc,
		this._buttonAdd,
		this._buttonSave
	) {
		_init();
	}

	void _init(){
		_buttonSave.onClick.listen(_addTodo);
		_buttonAdd.onClick.listen(_showModal);
	} 

	void _addTodo(MouseEvent event) {
		event.stopPropagation();

		var title = _inputTitle.value.toString();
		var desc = _inputDesc.value.toString();

		if(title.isNotEmpty || desc.isNotEmpty) {
			var _todo = Todo(_id++, title, desc);
			_todoList.add(_todo);

			updateAll();
			hideModal();
		} else {
			hideModal();
		}
	}

	void _delTodo(MouseEvent event) {
		event.stopPropagation();

		var div = (event.currentTarget as Element).parent;
		var button = (event.currentTarget as Element);

		var key = int.parse(button.id.split('-')[0]);
		_todoList.removeWhere((todo) => todo.id == key);

		div.remove();
		_id--;
		updateAll();
	}

	void updateAll() {
		_list.children.clear();

		if(_todoList.isNotEmpty) {
			var cardHeader = Utils.createItemHeader('Total $_id todos.');
			_list.children.add(cardHeader);
			_todoList.forEach((todo) {
				var card = Utils.createItem(todo, _delTodo);
				_list.children.add(card);
			});
		} else {	
			var cardHeader = Utils.createItemHeader('Is empty.');
			_list.children.add(cardHeader);
		}

	}

	void _clearInputs() {
		_inputTitle.value = '';
		_inputDesc.value = '';
		_inputTitle.children.clear();
		_inputDesc.children.clear();
	}

	void _showModal(MouseEvent event) {
		_modal.classes.add('show');
		_modalShow.classes.add('heartBeat');
	}

	void hideModal() {
		_modal.classes.remove('show');
		_clearInputs();
	}

}