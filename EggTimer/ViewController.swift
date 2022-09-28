//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    //MARK: Usando dicionario para refatorar o codigo
    
    let eggTimes = ["Soft": 3, "Medium": 4, "Hard": 7]
    var timer = Timer()
    var totalTime =  0
    var secondsPassed = 0
    var player: AVAudioPlayer!

    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var titleLabel: UILabel!
    
    /* CODIGO INICIAL:
    let softTime = 5
    let mediumTime = 7
    let hardTime = 12
    */
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        //zerar o timer
        timer.invalidate()
        
        //para saber qual o ovo selecionado pelo botao
        let hardness = sender.currentTitle!
        
        //para  saber qual o tempo associado ao botao selecionado
        totalTime = eggTimes[hardness]!
        
        //para zerar o progress bar
        progressBar.progress = 0.0
        secondsPassed = 0
        titleLabel.text =  hardness
        
        //definindo fatores do timer
    timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    
   
    }
    
    @objc func updateTimer() {
        if secondsPassed < totalTime {
            
            secondsPassed += 1
            progressBar.progress = Float(secondsPassed) / Float(totalTime)
            
        } else {
            timer.invalidate()
            titleLabel.text = "DONE!"
            
let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
    player = try! AVAudioPlayer(contentsOf: url!)
    player.play()
            
}
    
        
        
        
        //MARK: Usando o comando switch e case para refatorar o codigo
        /*switch hardness {
        case "Soft":
            print(softTime)
        case "Medium":
            print(mediumTime)
        default:
            print(hardTime)
        }
        */
    }
       /* CODIGO INICIAL
        if hardness == "Soft" {
            print(softTime)
        } else if hardness == "Medium" {
            print(mediumTime)
        } else {
            print(hardTime)
        }
     */
    
    
}
