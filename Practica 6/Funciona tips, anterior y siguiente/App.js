import React, { Component } from 'react';
import logo from './logo.svg';
import './App.css';
import Game from './Game';
import { connect } from 'react-redux';
import {questionAnswer, changeQuestion, submit, initQuestions} from './redux/actions'

class App extends Component {
  render() {
    console.log(this.props)
    return (
      <div className='App'>
        
         <Game question={this.props.questions[this.props.currentQuestion]}
           
               //tips = {this.props.questions[this.props.currentQuestion].tips}
               onQuestionAnswer={(answer)=>{this.props.dispatch(questionAnswer(this.props.currentQuestion, answer))}}
               //dependiendo de si se pulsa el boton 'Siguiente' o 'Anterior' se le sumará n = +/- 1
               //al indice de la pregunta actual para avanzar o retroceder.
               onChangeQuestion={(n)=>{this.props.dispatch(changeQuestion(this.props.currentQuestion + n))}} 
               onSubmit={()=>{this.props.dispatch(submit(this.props.questions))}}

              // onSubmit
              // onInitQuestions  
          />
      </div>  
    );
  }
}

function mapStateToProps(state) {
  return {
   ...state
  }
}

export default connect(mapStateToProps)(App);
