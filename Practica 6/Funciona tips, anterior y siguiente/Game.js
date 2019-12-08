
import React from 'react';

export default class Game extends React.Component {
	render() {
		return (
			<div>
			   <h1>{this.props.question.question}</h1> 
         <div>
            <img id='Imagen' height='400' width='600' src={this.props.question.attachment.url} alt=''/>
         </div>
         <input type='text' placeholder='Introduzca la respuesta' value={this.props.question.userAnswer || ''} onChange={(e)=>{this.props.onQuestionAnswer(e.target.value);}}/>
         {this.props.question.tips.map((tip)=><li>{tip}</li>)}
         <p>
            <button id='Anterior' onClick={()=>{this.props.onChangeQuestion(-1);}}>Anterior</button>
            <button id='Submit' onClick={()=>{this.props.onSubmit();}}>Submit</button>
            <button id='Siguiente' onClick={()=>{this.props.onChangeQuestion(1);}}>Siguiente</button>
         </p>       
			</div>
		);
	}
}