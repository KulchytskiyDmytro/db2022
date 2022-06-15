import { HttpClient } from '@angular/common/http';
import { Component, Injectable, OnInit } from '@angular/core';
import { FormBuilder } from '@angular/forms';
import { Backend } from 'src/constants/backend';
import { ITea } from 'src/interfaces/tea';

@Component({
  selector: 'app-admin',
  templateUrl: './admin.component.html',
  styleUrls: ['../../assets/css/bootstrap.css', '../../assets/css/style.css'],
})
@Injectable()
export class AdminComponent implements OnInit {
  checkoutForm = this.formBuilder.group<ITea>({
    name: '',
    description: '',
    image: '',
    sort: 'Dark',
    leaves: 'Large',
    price: 0,
  });

  constructor(private formBuilder: FormBuilder, private http: HttpClient) {}

  ngOnInit(): void {}

  onSubmit(): void {
    console.log(this.checkoutForm.value);


    this.http
      .post(Backend.baseUrl, this.checkoutForm.value, {
        headers: {
          'Access-Control-Allow-Origin': '*',
        },
      })
      .subscribe((response) => {
        alert("Tea Created");
      });
  }
}
