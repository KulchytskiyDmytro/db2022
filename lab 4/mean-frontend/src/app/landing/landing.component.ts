import { HttpClient } from '@angular/common/http';
import { Component, Injectable, OnInit } from '@angular/core';
import { Backend } from 'src/constants/backend';
import { ITea } from 'src/interfaces/tea';

@Component({
  selector: 'app-landing',
  templateUrl: './landing.component.html',
  styleUrls: ['../../assets/css/bootstrap.css', '../../assets/css/style.css'],
})
@Injectable()
export class LandingComponent implements OnInit {
  tea?: ITea[];

  constructor(private http: HttpClient) {}

  ngOnInit(): void {
    this.http.get<ITea[]>(Backend.baseUrl, {
      headers: {
        'Access-Control-Allow-Origin': '*'
      }
    }).subscribe((data: ITea[]) => {
      console.log('TEA RESPONSE:', data);
      this.tea = data;
    });
  }
}
