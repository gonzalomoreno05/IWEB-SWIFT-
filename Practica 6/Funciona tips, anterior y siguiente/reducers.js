
import { combineReducers } from 'redux';
import { QUESTION_ANSWER, CHANGE_QUESTION, SUBMIT, INIT_QUESTIONS } from './actions';

function score(state = 0, action = {}) {
	switch(action.type) {
		case SUBMIT:
		   state = 0;
		   for(let i=0;i<action.payload.length-1;i++){
		   	  if(action.payload[i].userAnswer === undefined){  //sustituimos las preguntas a las que no hayamos respondido por un string vacio para que no salte error.
		   	  	action.payload[i].userAnswer = '';
		   	  }
		   	  if(action.payload[i].answer.toString().toLowerCase() === action.payload[i].userAnswer.toString().toLowerCase()){
		   	  	state++;
		   	  }
		   }
		   console.log(state);
		   return state;		
		default:
		  return state;
	}
}

function finished(state = false, action = {}) {
	switch(action.type) {
		case SUBMIT:
		  state = true;
		  console.log(state);
		  return state;		
		default:
		  return state;
	}
}

function currentQuestion(state = 0, action = {}) {
	switch(action.type) {
		case CHANGE_QUESTION:
		   if(action.payload === 9){ // Se han completado las 10 preguntas
             document.getElementById('Siguiente').disabled = true; // Dshabilitamos boton siguiente
		   }
		   if(action.payload === 0){ // No hay preguntas anteriores
		   	 document.getElementById('Anterior').disabled = true; // Deshabilitamos boton anterior
		   }
		   if(action.payload !== 0){  // soluciona el error de que cuando volvais a la primera pregunta y volvias a avanzar se mantenia deshabilitado el boton "anterior"
		   	document.getElementById('Anterior').disabled = false;
		   }
		   if(action.payload !== 9){   // soluciona el error de que al llegar a la ultima pregunta si retrocedias se mantenia dehabilitado el boton de "siguiente"
		   	document.getElementById('Siguiente').disabled = false;
		   }
		   return action.payload;
		default:
		  return state;
	}
}

function questions(state = [], action = {}) {
	switch(action.type) {
		case QUESTION_ANSWER:
		   return state.map((question,i) => {
		   	return { ...question,
		   	           userAnswer: action.payload.index === i ?
		   	                       action.payload.answer : question.userAnswer}
		   });
		default:
		  return state;
	}
}


const GlobalState = (combineReducers({
	score,
	finished,
	currentQuestion,
	questions

}));

export default GlobalState;