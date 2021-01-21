//
//  ViewController.swift
//  Mairipora
//
//  Created by ADMIN on 14/05/16.
//  Copyright © 2016 Octa. All rights reserved.
//

import UIKit
import MessageUI

class ViewController: UIViewController, MFMailComposeViewControllerDelegate {

    @IBAction func bttRede(_ sender: AnyObject) {
        if let url = URL(string: "http://www.redemairipora.com.br") {
            UIApplication.shared.openURL(url)
        }
    }
    
    @IBAction func bttOcta(_ sender: AnyObject) {
        if let url = URL(string: "http://www.octa.com.br") {
            UIApplication.shared.openURL(url)
        }
    }
    
    @IBAction func bttMail(_ sender: AnyObject) {
        
      let mail: MFMailComposeViewController = MFMailComposeViewController()
        
         mail.mailComposeDelegate = self
        
         mail.setToRecipients(["contato@redemairipora.com.br"])
         mail.setSubject("Contato via app Na Hora")
         mail.setMessageBody("Escreva aqui sua opinião ou sugestão", isHTML: false)
        
        self.present(mail, animated: true, completion: nil)
 /*
        let email = enviarMail()
        if MFMailComposeViewController.canSendMail() {
            self.presentViewController(email, animated: true, completion: nil)
        } else {
            self.mailAlertaDeErro()
    }
*/
    }

    @IBAction func bttFacebook(_ sender: AnyObject) {
        if let url = URL(string: "http://facebook.com/redemairipora") {
            UIApplication.shared.openURL(url)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        
        self.dismiss(animated: true, completion: nil)
    }
 /*
    func enviarMail() -> MFMailComposeViewController {
        let mailDetalhes = MFMailComposeViewController()
        mailDetalhes.mailComposeDelegate = self
        
        mailDetalhes.setToRecipients(["contato@redemairipora.com.br"])
        mailDetalhes.setSubject("Contato Na Hora")
        mailDetalhes.setMessageBody("Mensagem enviada a partir do Aplicativo Na Hora", isHTML: false)
        
        return mailDetalhes
    }
 
    func mailAlertaDeErro () {
        let enviaAlertaErro = UIAlertController(title: "eMail não foi enviado", message: "Não foi possível enviar o email. Você pode escrever diretamente para: contato@redemairipora.com.br", preferredStyle: UIAlertControllerStyle.Alert )
     
        showViewController(enviaAlertaErro ,sender: self)
    }
    
    

    func sairMail(controller: MFMailComposeViewController!, didFinishWithResult result: MFMailComposeResult, error: NSError!) {
      
        controller.dismissViewControllerAnimated(true , completion: nil)
    }
 */
}

