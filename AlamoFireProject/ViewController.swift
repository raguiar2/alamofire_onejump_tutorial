//
//  ViewController.swift
//  AlamoFireProject
//
//  Created by Rui Aguiar on 11/2/17.
//  Copyright © 2017 vegans. All rights reserved.
//

import UIKit
import Alamofire
import Foundation

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // First request
        //sendFirstRequest()
        
        //How to make a request with headers
        //requestWithHeaders()
        
        //requestWithParams()
        
        //printResponseData()
        // if it returns a JSON response, we can use a swift JSON library (SwiftyJSON) to parse the data out of this.
        // We can also just cast the content as a NSDictionary. parseJSONRequest shows you how to get items from the response.
        //parseJSONRequest()
        
        // Finally, we can put it toghther to sign up someone for OneJump.
        //oneJumpSignupRequest()
        
        
        // We can also use the auth header in our onejump requests where it's required
        oneJumpAddTeacher()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func sendFirstRequest(){
        Alamofire.request("https://httpbin.org/get").responseJSON { response in
            print("Request: \(String(describing: response.request))")   // original url request
            print("Response: \(String(describing: response.response))") // http url response
            print("Result: \(response.result)")                         // response serialization result
            
            if let json = response.result.value {
                print("JSON: \(json)") // serialized json response
            }
            
            if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
                print("Data: \(utf8Text)") // original server data as UTF8 string
            }
        }
    }
    
    func requestWithHeaders(){
        // Request with headers and auth token.
        let auth_token = "example_token"
        let signup_url = "https://www.onejump.org/api/v1/students/add_teacher"
        // Sending HTTP request with headers
        let headers = ["auth_token":auth_token]
        print("response is")
        Alamofire.request(signup_url, headers: headers).responseJSON { response in
            debugPrint(response)
        }
    }
    func requestWithParams(){
        //Request with object that OneJump sent us
        // You want to pass params in as a dictionary.
        let signup_url = "https://www.onejump.org/api/v1/students/sign_up"
        let params =  [
            "student":[
                "email":"usamakhan0945@gmail.com",
                "school":"abc",
                "city":"Lahore",
                "gpa":"3.4",
                "number":"123456789",
                "state":"punjab",
                "accepts_terms":"true",
                "first_name":"Ferhan",
                "last_name":"Namsim",
                "dob":"4/4/1991",
                "grade_level":"12th",
                "password":"12345678",
                "password_confirmation":"12345678",
                "sources":"abc"
            ]
        ]
        Alamofire.request(signup_url, parameters: params).responseString { response in
            debugPrint(response)
        }
    }
    func printResponseData(){
        // We can save the response as an object and use it to display/verify search results, etc.
        let signup_url = "https://www.apple.com"
        let response = Alamofire.request(signup_url).response
        print("response code")
        print(response?.statusCode)
        
        Alamofire.request(signup_url).responseString { response in
            //print(response.request)  // original URL request
            print("Response")
            print(response.response) // URL response
            print(response.response?.statusCode) // URL response
            print(response.response?.url) // URL response
            
            //print(response.data)     // server data
            print(response.result)   // result of response serialization
            
        }
    }
    
    func parseJSONRequest(){
        //Example of JSON response and parsing:
        let root = "https://jsonplaceholder.typicode.com"
        let suffix = "/posts/1"
        Alamofire.request(root+suffix).responseJSON{ response in
            let response_contnet = response.result.value as! NSDictionary
            print(response_contnet)
            print("User ID from response:")
            print(response_contnet["userId"])
            
        }
    }
    
    //Making an example POST request to the oneJump signup page as a student.
    func oneJumpSignupRequest(){
        let url = "https://www.onejump.org/api/v1/students/sign_up"
        // we don't need the auth token for the sign_up and log_in requests.
        // but we need it for everything else.
        let studentprops =  ["email":"rui7947@gmail.com",
        "school":"abc",
        "city":"Lahore",
        "gpa":"3.4",
        "number":"123456789",
        "state":"punjab",
        "accepts_terms":"true",
        "first_name":"Ferhan",
        "last_name":"Namsim",
        "dob":"4/4/1991",
        "grade_level":"12th",
        "password":"12345678",
        "password_confirmation":"12345678",
        "sources":"abc"
    ]
        let parameters = ["student":studentprops]
        // This is a post request, so we specify method:.post
        // method defaults to .get, so only specify this if it's not a
        // get request.
        Alamofire.request(url, method:.post, parameters: parameters).responseJSON { response in
            print(response.response!.statusCode) // if this is 200, it worked to sign up a student.
        }
    }
    func oneJumpAddTeacher(){
        // This example token should be replaced with the one from the google doc in the add_teacher response. 
        let auth_token = "example_token"
        let url = "https://www.onejump.org/api/v1/students/add_teacher"
        let studentprops =  ["email":"rui7947@gmail.com",
                             "school":"abc",
                             "city":"Lahore",
                             "gpa":"3.4",
                             "number":"123456789",
                             "state":"punjab",
                             "accepts_terms":"true",
                             "first_name":"Ferhan",
                             "last_name":"Namsim",
                             "dob":"4/4/1991",
                             "grade_level":"12th",
                             "password":"12345678",
                             "password_confirmation":"12345678",
                             "sources":"abc"
        ]
        let classcodeprops = [
            "tid":"ZSVVHA",
            "student_id":"3028"
        ]

        let parameters = ["student":studentprops, "class_code":classcodeprops]
        let headers = ["auth_token":auth_token]
        Alamofire.request(url, method:.post, parameters:parameters,headers:headers).responseJSON{ response in
            // If the status code is 200, we added the oppurtunity correctly.
            if response.response?.statusCode == 200{
                print("Success! oppurtunity added.")
                print(response.result)
            }
            else{
                
            }
        }
        
    }

}

