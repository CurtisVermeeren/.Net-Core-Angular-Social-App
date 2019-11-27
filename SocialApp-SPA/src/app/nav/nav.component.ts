import { Component, OnInit } from '@angular/core';
import { AuthService } from '../_services/auth.service';
import { AlertifyService } from '../_services/alertify.service';

@Component({
    selector: 'app-nav',
    templateUrl: './nav.component.html',
    styleUrls: ['./nav.component.css']
})
export class NavComponent implements OnInit {
    model: any = {
        
    };

    constructor(public authService: AuthService, private alertify: AlertifyService) { }

    ngOnInit() {
    }

    // login calls the authorization 
    login() {
        this.authService.login(this.model).subscribe(next => {
            this.alertify.success('Logged in successfully')
        }, error => {
            this.alertify.error(error)
        });
    }

    // loggedIn checks is there is a logged in token
    loggedIn() {
        return this.authService.loggedIn();
    }

    // logout removes the token from storage
    logout() {
        localStorage.removeItem('token');
        this.alertify.message('Logged out');
    }

    

}
