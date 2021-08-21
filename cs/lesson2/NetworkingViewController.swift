//
//  NetworkingViewController.swift
//  cs
//
//  Created by Olga Chumakova on 15.08.2021.
//

import UIKit
import Alamofire

class NetworkingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //firstRequest()
       secondRequest()
    }
    
    func secondRequest() {
        let baseURL = "https://samples.openweathermap.org"
        let path = "/data/2.5/forcast"

        let url = "\(baseURL)\(path)"
        var urlParameters: Parameters = [
                  "q": "Moscow,DE",
                  "appid": "b1b15e88fa797225412429c1c50c122a1"
              ]

        AF.request(url, method: .get, parameters: urlParameters).responseJSON { response in
            print(response.request)
            print(response.response)
            print(response.data)
            print(response.result)
        }
    }
    
    // guard - оператор раннего выхода, если url не получаем, то выходим из метода
    func firstRequest() {
        
        guard let url = URL(string: "https://samples.openweathermap.org/data/2.5/forecast?q=Moscow,DE&appid=b1b15e88fa797225412429c1c50c122a1")
        else { return }
        
        let session = URLSession.shared   //как singleton
        
        let task = session.dataTask(with: url) {data, response, error in
            
            guard let data = data else {return}
            
        let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments)
            
            print(json)
    }
        task.resume()
}

    func thirdRequest (){
        
    }
}
