import React, {Component} from 'react'
import './style.css'

export default class Login extends Component{
    constructor(props){
        super(props)
        this.state={
            email:"",
            password:"",
        };
    }

    render(){
        return(
            <div class="dj">
                <h3>Login</h3>
                <div class="C1">
                    
                    <br></br>
                    <input type="text" 
                    className="input-container" 
                    placeholder="Email">
                </input>
                </div>

                <div class="C1">
                    
                    <br></br>
                    <input type="text" 
                    className="input-container" 
                    placeholder="Password">
                </input>
                </div>

                <br></br>

                <div class="C1">
                    <button type='Login' className='button-container'>Login
                    </button>
                </div>
                
                </div>
        )
    }
}

