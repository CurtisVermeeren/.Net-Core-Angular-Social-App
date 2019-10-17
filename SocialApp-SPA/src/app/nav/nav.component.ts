import { Component, OnInit } from '@angular/core';
import { AuthService } from '../_services/auth.service';

@Component({
    selector: 'app-nav',
    templateUrl: './nav.component.html',
    styleUrls: ['./nav.component.css']
})
export class NavComponent implements OnInit {
    model: any = {
        
    };

    constructor(private authService: AuthService) { }

    ngOnInit() {
    }

    // login calls the authorization 
    login() {
        this.authService.login(this.model).subscribe(next => {
            console.log('Logged in successfully');
        }, error => {
            console.log('Failed to login');
        });
    }

    // loggedIn checks is there is a logged in token
    loggedIn() {
        const token = localStorage.getItem('token');
        return !!token; 
    }

    // logout removes the token from storage
    logout() {
        localStorage.removeItem('token');
        console.log('Logged out');
    }

}
