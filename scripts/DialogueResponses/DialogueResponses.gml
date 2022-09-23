/// @arg Response
function DialogueResponses(_response){
	switch(_response)
	{
		/// Nothing happens
		case 0: break;
		/// first response for QuestyNPC
		case 1: NewTextBox("You gave response A!", 1); break;
		case 2: NewTextBox("You gave response B! Any further response?", 1, ["3:Yes!", "0:No."]); break;
		case 3: NewTextBox("Thanks for your responses!", 0); break;
		default: break;
	}
}