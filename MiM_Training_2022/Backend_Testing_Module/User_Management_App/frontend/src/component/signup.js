import React, {Component} from 'react'
import './style.css'
import './login.js'

export default class Signup extends Component{
    constructor(props){
        super(props)
        this.state={
            fname:"",
            lname:"",
            email:"",
            password:"",
        };
    }

    render(){
        return(
            
                <div class="container">
                <form action='' method='Post'>
                <h2>Registeration</h2>
                <div class="content">
                    <div class="input-box">
                    <input type="text" 
                           placeholder="Enter full name " name='name' required>
                    </input>
                    </div>

                    <div class="input-box">
                    <input type="text" 
                           placeholder="Enter username " name='uname' required>
                    </input>
                    </div>

                    <div class="input-box">
                    <input type="email" 
                           placeholder="Enter your valid email address" name='email' required>
                    </input>
                    </div>

                    <div class="input-box">
                    <input type="tel"
                           placeholder="Enter cell number " name='cellnumber' required>
                    </input>
                    </div>

                    <div class="input-box">
                    <input type="password" 
                           placeholder="Enter password " name='password' required>
                    </input>
                    </div>

                    <div class="input-box">
                    <input type="password" 
                           placeholder="Enter confirm password" name='confirmpassword' required>
                    </input>
                    </div>

                    <span class="gender-title">Gender</span>
                    <div class="gender-category">
                        <input type="radio" name="gender" id="male"></input>
                        <label for="gender">Male</label>
                        <input type="radio" name="gender" id="female"></input>
                        <label for="gender">Female</label>
                        <input type="radio" name="gender" id="other"></input>
                        <label for="gender">Other</label>
                    </div>
                </div>
                <div class="alert">
                    <p>By clicking signup you agree to our<a href="#">Terms,</a><a href="#">Privacy Policy,</a> and 
                    <a href="#">Cookies Policy.</a>you may recieve sms notifications form us and can opt out at any time.</p>
                </div>
                <div class="button-container">
                    <button type='submit'>Register</button>
                </div>
                </form>
                </div>
        )
    }
}

