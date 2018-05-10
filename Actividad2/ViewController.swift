//
//  ViewController.swift
//  Actividad2
//
//  Created by Mac Tecsup on 9/05/18.
//  Copyright © 2018 Mac Tecsup. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var initialValue: UITextField!
    
    @IBOutlet weak var finalValue: UITextField!
    
    @IBOutlet weak var fromSegment: UISegmentedControl!
    
    @IBOutlet weak var toSegment: UISegmentedControl!
    
    
    @IBAction func convertir(_ sender: Any) {
        
        if(Double(initialValue.text!) != nil){
            
            let numero : Double = Double(initialValue.text!)!
            var resultado : Double = 0.0
            
            switch(fromSegment.selectedSegmentIndex){
            case 0:
                
                
                resultado = millasConverter(inicial: numero, toSegment: toSegment.selectedSegmentIndex)
                
                finalValue.text = "\(fixData(valor: numero)) \(getType(index: fromSegment.selectedSegmentIndex)) = \(fixData(valor: resultado)) \(getType(index: toSegment.selectedSegmentIndex))"
                
                break;
                
            case 1:
                
                resultado = kmConverter(inicial: numero, toSegment: toSegment.selectedSegmentIndex)
                
                finalValue.text = "\(fixData(valor: numero)) \(getType(index: fromSegment.selectedSegmentIndex)) = \(fixData(valor: resultado)) \(getType(index: toSegment.selectedSegmentIndex))"
                break;
                
            case 2:
                
                resultado = yardConverter(inicial: numero, toSegment: toSegment.selectedSegmentIndex)
                
                finalValue.text = "\(fixData(valor: numero))  \(getType(index: fromSegment.selectedSegmentIndex)) \(fixData(valor: resultado)) \(getType(index: toSegment.selectedSegmentIndex))"
                
                break;
                
            default:
                
                break;
                
            }
            
        } else {
            finalValue.text = "Verifica tu valor"
            }
        }
    
    func getType(index:Int) -> String {
        
        var res : String = ""
        switch index {
        case 0:
            res = "Millas"
            break
        case 1:
            res = "Kms"
            break
        case 2:
            res = "Yardas"
            break
        default:
            break
        }
        return res
    }
    
    func yardConverter(inicial:Double,toSegment:Int) -> Double {
        var resultado:Double = 0.0
        switch toSegment {
        case 0:
            resultado = yardtomill(valor: inicial)
            break
        case 1:
            resultado = yardtokm(valor: inicial)
            break
        case 2:
            resultado = inicial
            break
        default:
            break
        }
        
        return resultado
    
    }
    
    func kmConverter(inicial:Double, toSegment:Int) -> Double {
        var resultado : Double = 0.0
        switch toSegment {
        case 0:
            resultado = kmtomill(valor: inicial)
            break
        case 1:
            resultado = inicial
            break
        case 2:
            resultado = kmtoyard(valor: inicial)
            break
        default:
            break
        }
        return resultado
        
    }
    
    func millasConverter(inicial:Double, toSegment:Int) -> Double {
        var resultado:Double = 0.0
        switch toSegment {
        case 0:
            resultado = inicial
            break
        case 1:
            resultado = milltokm(valor: inicial)
            break
        case 2:
            resultado = milltoyard(valor: inicial)
            break
        default:
            break
        }
        return resultado
    }
    
    func fixData(valor: Double) -> String {
        return String(format: "%.2f", valor)
    }
    
    func kmtomill(valor: Double) -> Double{
        return valor*0.621371
    }
    
    func kmtoyard(valor: Double) -> Double{
        return valor*1093.61
    }
    
    func milltokm(valor: Double) -> Double{
        return valor*1.60934
    }
    
    func milltoyard(valor: Double) -> Double{
        return valor*1760
    }
    
    func yardtokm(valor: Double) -> Double{
        return valor*0.0009144
    }
    
    func yardtomill(valor: Double) -> Double{
        return valor*0.000568182
    }
    func setResult( label:UILabel, initialValue:Double, fromValue:Int, toValue:Int, finalValue:Double){
        
        label.text = "\(fixData(valor: initialValue)) \(getType(index: fromValue)) = \(fixData(valor: finalValue)) \(getType(index: toValue))"
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

