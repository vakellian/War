import UIKit
import AVFoundation

class ViewController: UIViewController {
   
    @IBOutlet weak var firstCard: UIImageView!
    @IBOutlet weak var secondCard: UIImageView!
    @IBOutlet weak var dealButton: UIButton!
    @IBOutlet weak var p1ScoreLbl: UILabel!
    @IBOutlet weak var enemyScoreLbl: UILabel!
    @IBOutlet weak var victoryLbl: UILabel!
    @IBOutlet weak var musicSwitch: UISwitch!
    @IBOutlet weak var MainMenuButton: UIButton!
    
    var p1Score = 0
    var enemyScore = 0
    
    var musicURL:NSURL = NSBundle.mainBundle().URLForResource("dean", withExtension: "mp3")!
    
    var musicPlayer = AVAudioPlayer()
    
    var cards:[String] = ["card2", "card3", "card4", "card5", "card6", "card7", "card8", "card9", "card10", "jack", "queen", "king", "ace"]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func dealButtonPressed(sender: AnyObject) {
        
        let random1 = Int(arc4random_uniform(13))
        let cardString1:String = self.cards[random1]
        
        let random2 = Int(arc4random_uniform(13))
        let cardString2:String = self.cards[random2]
        
        firstCard.image = UIImage(named: cardString1)
        secondCard.image = UIImage(named: cardString2)
        
        if random1 > random2 {
            p1Score++
            p1ScoreLbl.text = String(p1Score)
        } else if random1 < random2 {
            enemyScore++
            enemyScoreLbl.text = String(enemyScore)
        }
        
        if p1Score == 10 {
            victoryLbl.text = "You Win!"
            dealButton.hidden = true
        } else if enemyScore == 10 {
            victoryLbl.text = "You Lose..."
            dealButton.hidden = true
        }
        
        
        
    }
    @IBAction func musicSwitchPressed(sender: AnyObject) {
        if musicSwitch.on {
            do { musicPlayer = try AVAudioPlayer(contentsOfURL: musicURL, fileTypeHint: nil) } catch _{ return print("file not found")}
            musicPlayer.play()
        } else {
            musicPlayer.stop()
        }
    }

    @IBAction func MenuMusicOff(sender: AnyObject) {
        if musicSwitch.on{
            musicPlayer.stop() 
        }
    }
}

