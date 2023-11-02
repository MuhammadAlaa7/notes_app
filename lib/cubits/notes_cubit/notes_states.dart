import '../../model/note.dart';

abstract class GetNotesStates {}

class GetNotesInitialState extends GetNotesStates {}
class GetNoteSuccessfully extends GetNotesStates {}
class GetNotesSuccessState extends GetNotesStates {

final  List<NoteModel> notes ;

  GetNotesSuccessState({required this.notes}); 

}
