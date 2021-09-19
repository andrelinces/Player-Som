//
//  ViewController.swift
//  Player Som
//
//  Created by Andre Linces on 18/09/21.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    //instanciando o objeto
    var player = AVAudioPlayer()
    
    //outlet (referência) para capturar os valores conforme movimenta o slider.
    @IBOutlet weak var sliderVolume: UISlider!
    
    
    @IBAction func atualizarVolume(_ sender: Any) {
        player.volume = sliderVolume.value
    }
    
    @IBAction func play(_ sender: Any) {
        //Método para executar o audio
        player.play()
    }
    
    @IBAction func pause(_ sender: Any) {
        player.pause()
    }
    
    @IBAction func stop(_ sender: Any) {
        player.stop()
        player.currentTime = 0
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Utilizando a classe 'Bundle' que permite acessar diretórios do app, para criar o path (caminho) para utilizar objeto URL
        if let path = Bundle.main.path(forResource: "bach", ofType: "mp3"){
            //criando uma URL para usar no AVAudioPlayer, como parâmetro o path(caminho)
            let url = URL(fileURLWithPath: path)
            //recebendo uma URL para utilizar como player
            
            do {
                player = try AVAudioPlayer(contentsOf: url)
                //Método para preparar o audio
                player.prepareToPlay()
                
                
                
            } catch  {
                print("Erro ao executar o som")
            }
            
        }
    }


}

