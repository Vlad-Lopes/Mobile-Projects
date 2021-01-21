//
//  MunicipalViewController.swift
//  Mairipora
//
//  Created by ADMIN on 21/05/16.
//  Copyright © 2016 Octa. All rights reserved.
//

import UIKit

class MunicipalViewController: UIViewController , UITableViewDelegate , UITableViewDataSource {

    @IBOutlet weak var lblNomeLinha: UILabel!
    
    @IBOutlet weak var tblMunicipal: UITableView!
    
    @IBOutlet weak var vwPropaganda: UIImageView!
    
    var nomeDaLinha = ""
    var dia = "Seg"
    // var propaganda: UIImage?
    
    
    let tabBarreiroHoraSeg = ["06:10", "08:00", "10:00", "12:00", "12:20", "14:00", "16:00", "18:10", "18:30", "23:00"]
    let tabBarreiroDetalheSeg = ["Pinheiral", "Pinheiral", "Pinheiral",  "Forum – Dia Letivo", "Forum", "Pinheiral", "Pinheiral", "Pinheiral",  "Forum – Dia Letivo", "Forum – Dia Letivo"]
    let tabBarreiroHoraSab = ["08:00", "10:00", "12:00", "14:00", "17:30"]
    let tabBarreiroDetalheSab = ["Pinheiral", "Pinheiral", "Pinheiral", "Pinheiral", "Pinheiral"]
    let tabBarreiroHoraDom = ["09:00", "12:00"]
    let tabBarreiroDetalheDom = ["Pinheiral", "Pinheiral"]
    
    let tabMatoHoraSeg = ["04:50", "05:40", "05:45", "07:00", "07:30", "08:15", "09:00", "09:30", "10:15", "10:45", "11:55", "12:00", "13:15", "13:50", "14:30", "15:00", "15:40", "16:15", "16:45", "17:55", "18:00", "19:10", "19:30", "20:45", "21:30", "22:00", "23:40"]
    let tabMatoDetalheSeg = ["Via Sto. Antonio", "Via Marciano", "Via Sto. Antonio", "Via Marciano", "Via Sto. Antonio", "Via Marciano", "Via Sto. Antonio", "Via Marciano", "Via Sto. Antonio", "Via Marciano", "Via Sto. Antonio", "Via Marciano", "Via Sto. Antonio", "Via Marciano", "Via Marciano", "Via Sto. Antonio", "Via Marciano", "Via Sto. Antonio", "Via Marciano", "Via Sto. Antonio", "Via Marciano", "Via Sto. Antonio", "Via Marciano", "Via Sto. Antonio", "Via Marciano", "Via Sto. Antonio", " Via Sto. Antonio"]
    let tabMatoHoraSab = ["05:45", "07:00", "08:30", "10:30", "12:00", "13:00", "14:00", "15:30", "17:00", "19:00", "20:30"]
    let tabMatoDetalheSab = [" ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " "]
    let tabMatoHoraDom = ["07:00", "09:00", "10:30", "12:30", "14:00", "16:00", "18:40", "20:00"]
    let tabMatoDetalheDom = [" ", " ", " ", " ", " ", " ", " ", " " ]
    
    let tabCaceiaHoraSeg = ["05:40", "06:50", "08:10", "09:30", "10:45",  "12:00", "12:30", "13:30", "15:00", "16:30", "17:45", "18:30", "19:10", "21:30", "23:30"]
    let tabCaceiaDetalheSeg = ["Ida Estrada do Governo", "Volta Estrada do Governo", "Volta Estrada do Governo", "Volta Estrada do Governo", "Volta Estrada do Governo",  "Ida e Volta Cacéia", "Volta Estrada do Governo", "Volta Estrada do Governo", "Volta Estrada do Governo", "Ida Estrada do Governo", "Volta Estrada do Governo", "Volta Estrada do Governo", "Volta Estrada do Governo", "Volta Estrada do Governo", "Volta Estrada do Governo"]
    let tabCaceiaHoraSab = ["06:00", "08:00", "11:30", "14:00",  "17:00"]
    let tabCaceiaDetalheSab = ["Volta Estrada do Governo", "Volta Estrada do Governo", "Volta Estrada do Governo", "Volta Estrada do Governo", "Volta Estrada do Governo"]
    let tabCaceiaHoraDom = ["06:00", "10:00", "17:00"]
    let tabCaceiaDetalheDom = ["Volta Estrada do Governo", "Volta Estrada do Governo", "Ida e Volta Cacéia" ]
    
    let tabHortoHoraSeg = ["05:45", "07:00", "08:00", "09:30",  "11:00", "12:00", "13:00", "14:00", "15:00", "16:00", "17:00", "18:00", "19:00", "20:00",  "21:30", "23:30"]
    let tabHortoDetalheSeg = [" ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", "Dia Letivo"]
    let tabHortoHoraSab = ["06:00", "07:00", "09:00", "11:00", "12:00", "13:00", "15:00", "17:00", "19:00"]
    let tabHortoDetalheSab = [" ",  " ", " ", " ", " ", " ", " ", " ", " "]
    let tabHortoHoraDom = ["07:00", "09:00", "11:00", "12:00", "13:00", "15:00", "17:00", "19:00"]
    let tabHortoDetalheDom = [" ",  " ", " ", " ", " ", " ", " ", " " ]
    
    let tabTerraHoraSeg = ["05:00", "05:20", "05:40", "06:00", "06:10", "06:30", "06:50", "07:10", "07:20", "07:40", "08:00", "08:20", "08:40", "09:00", "09:20",  "09:40", "10:00", "10:20", "10:40", "11:00", "11:20", "11:40", "12:00", "12:20", "12:40",  "13:00", "13:20", "13:40",  "14:00", "14:20", "14:40",  "15:00", "15:20", "15:40",  "16:00", "16:20", "16:40",  "17:00", "17:20", "17:40",   "18:00", "18:10", "18:30", "19:00", "19:30", "20:00", "20:30", "21:00", "21:30",  "22:15", "22:30"]
    let tabTerraDetalheSeg = [ "Cemitério ", "Centro", "Cemitério ", "Centro",  "Cemitério ", "Centro",  "Cemitério ", "Centro",  "Cemitério via ETEC ", "Centro",  "Cemitério ", "Centro",  "Cemitério ", "Centro",  "Cemitério ", "Centro",  "Cemitério ", "Centro",  "Cemitério ", "Centro",  "Cemitério ", "Centro",  "Cemitério ", "Centro",  "Cemitério ", "Centro",  "Cemitério ", "Centro",  "Cemitério ", "Centro",  "Cemitério ", "Centro",  "Cemitério ", "Centro",  "Cemitério ", "Centro",  "Cemitério ", "Centro",  "Cemitério ", "Centro",  "Cemitério ", "Centro",  "Cemitério ", "Centro", "Cemitério ", "Centro",  "Cemitério ", "Centro", "Cemitério ", "Centro",  "Cemitério "]
    let tabTerraHoraSab = ["05:00", "05:20", "05:40", "06:00", "06:10", "06:30", "06:50", "07:10", "07:20", "07:40", "08:00", "08:20", "08:40", "09:00", "09:20",  "09:40", "10:00", "10:20", "10:40", "11:00", "11:20", "11:40", "12:00", "12:20", "12:40",  "13:00", "13:20", "13:40",  "14:00", "14:20", "14:40",  "15:00", "15:20", "15:40",  "16:00", "16:20", "16:40",  "17:00", "17:20", "17:40",   "18:00", "18:10", "18:30", "19:00", "19:30", "20:00", "20:30", "21:00", "21:30",  "22:00"]
    let tabTerraDetalheSab = ["Cemitério ", "Centro", "Cemitério ", "Centro",  "Cemitério ", "Centro",  "Cemitério ", "Centro",  "Cemitério", "Centro",  "Cemitério ", "Centro",  "Cemitério ", "Centro",  "Cemitério ", "Centro",  "Cemitério ", "Centro",  "Cemitério ", "Centro",  "Cemitério ", "Centro",  "Cemitério ", "Centro",  "Cemitério ", "Centro",  "Cemitério ", "Centro",  "Cemitério ", "Centro",  "Cemitério ", "Centro",  "Cemitério ", "Centro",  "Cemitério ", "Centro",  "Cemitério ", "Centro",  "Cemitério ", "Centro",  "Cemitério ", "Centro",  "Cemitério ", "Centro", "Cemitério ", "Centro",  "Cemitério ", "Centro", "Cemitério ", "Centro"]
    let tabTerraHoraDom = ["06:00", "06:25", "06:50", "07:15", "07:40", "08:05", "08:30", "08:55", "09:20",  "09:45", "10:10", "10:35", "11:00", "11:25", "11:50", "12:15", "12:40",  "13:05", "13:30", "13:55", "14:20", "14:45",  "15:10", "15:35",  "16:00", "16:25", "16:50",  "17:15", "17:40",  "18:05", "18:30", "19:00", "19:30", "20:00", "20:30"]
    let tabTerraDetalheDom = ["Cemitério ", "Centro", "Cemitério ", "Cemitério ", "Centro",  "Cemitério ", "Cemitério", "Centro",  "Cemitério ", "Cemitério ", "Centro",  "Cemitério ", "Cemitério ", "Centro",  "Cemitério ", "Cemitério ", "Centro",  "Cemitério ", "Centro",  "Cemitério ", "Centro", "Centro",  "Cemitério ", "Centro",  "Centro",  "Cemitério ", "Centro",  "Centro", "Cemitério ", "Centro", "Centro",  "Cemitério ", "Centro",  "Centro", "Cemitério "]
    
    let tabApolinarioHoraSeg = ["08:30", "09:20", "10:15", "11:00", "15:00", "16:15", "19:15"]
    let tabApolinarioDetalheSeg = [ " ", " ", " ", " ", " ", " ", " "]
    let tabApolinarioHoraSab = [" "]
    let tabApolinarioDetalheSab = [ "Não circula aos Sábados"]
    let tabApolinarioHoraDom = [" "]
    let tabApolinarioDetalheDom = [ "Não circula aos Domingos"]
    
    let tabBoaVistaHoraSeg = ["07:00"]
    let tabBoaVistaDetalheSeg = ["Boa Vista/Campininha"]
    let tabBoaVistaHoraSab = [" "]
    let tabBoaVistaDetalheSab = [ "Não circula aos Sábados"]
    let tabBoaVistaHoraDom = [" "]
    let tabBoaVistaDetalheDom = [ "Não circula aos Domingos"]
    
    let tabLagosHoraSeg = ["06:20", "12:15", "17:00", "18:20"]
    let tabLagosDetalheSeg = ["Saida de Pirucaia - Dia Letivo", " ", " ", " "]
    let tabLagosHoraSab = [" "]
    let tabLagosDetalheSab = [ "Não circula aos Sábados"]
    let tabLagosHoraDom = [" "]
    let tabLagosDetalheDom = [ "Não circula aos Domingos"]
    
    let tabGuavirutuvaHoraSeg = ["05:00", "08:30", "10:45", "12:30", "14:30", "15:30", "17:30", "18:30", "23:40"]
    let tabGuavirutuvaDetalheSeg = [ "Tapera Grande", " ", " ", "Tapera Grande", " ", " ", "Via Melchior", "Tapera, Via Melchior", "Dia Letivo"]
    let tabGuavirutuvaHoraSab = ["06:00", "07:00", "11:15", "13:30", "17:00", "18:30"]
    let tabGuavirutuvaDetalheSab = [" ", " ", " ", " ", " ", " "]
    let tabGuavirutuvaHoraDom = ["07:00", "11:30", "17:00"]
    let tabGuavirutuvaDetalheDom = [" ", " ", " "]
    
    let tabCapimHoraSeg = ["05:50", "19:30", "21:00"]
    let tabCapimDetalheSeg = [ "Saida de Capim Branco", " ", " "]
    let tabCapimHoraSab = [" "]
    let tabCapimDetalheSab = [ "Não circula aos Sábados"]
    let tabCapimHoraDom = [" "]
    let tabCapimDetalheDom = [ "Não circula aos Domingos"]

    let tabMarmeloHoraSeg = ["05:00", "08:50", "10:50", "12:30", "14:50", "16:50", "18:40", "23:30"]
    let tabMarmeloDetalheSeg = [" ", " ", " ", " ", " ", "Via Melchior", "Via Melchior/P. Galrão", "Dia Letivo"]
    let tabMarmeloHoraSab = ["05:30", "09:00", "12:30", "15:30"]
    let tabMarmeloDetalheSab = [" ", " ", " ", " "]
    let tabMarmeloHoraDom = ["05:00", "09:30", "14:30", "18:40"]
    let tabMarmeloDetalheDom = [" ", " ", " ", " "]
    
    let tabCapoavinhaHoraSeg = ["06:00", "06:45", "09:00", "11:50", "13:00", "15:00", "16:55", "17:40", "19:00", "21:00", "23:40"]
    let tabCapoavinhaDetalheSeg = [" ", " ", " ",  " ", " ", " ", " ", " ",  " ", " ", "Dia Letivo"]
    let tabCapoavinhaHoraSab = ["06:40", "09:00", "11:00", "13:00", "15:30", "18:30"]
    let tabCapoavinhaDetalheSab = [" ", " ", " ", " ", " ", " "]
    let tabCapoavinhaHoraDom = ["08:00", "10:00", "12:00", "14:00", "17:00"]
    let tabCapoavinhaDetalheDom = [" ", " ", " ", " ", " "]
    
    let tabPedreiraHoraSeg = ["06:00", "07:10", "09:30", "12:10", "13:10", "15:00", "17:10", "18:30", "20:30", "23:40"]
    let tabPedreiraDetalheSeg = [" ", " ", " ",  " ", " ", " ", " ", " ",  " ", "Dia Letivo"]
    let tabPedreiraHoraSab = ["07:10", "10:00", "12:30", "15:00", "18:30"]
    let tabPedreiraDetalheSab = [" ", " ", " ", " ", " "]
    let tabPedreiraHoraDom = ["07:10", "12:30", "15:00", "18:30"]
    let tabPedreiraDetalheDom = [" ", " ", " ", " "]
    
    let tabVicenteHoraSeg = ["05:50", "07:10", "09:30", "11:30", "12:30", "14:00", "16:30", "18:20", "23:40"]
    let tabVicenteDetalheSeg = [" ", " ", "Via Vila Machado", " ", " ", " ", "Via Vila Machado", " ", "Dia Letivo"]
    let tabVicenteHoraSab = ["07:10", "09:30", "13:10", "16:30", "18:20", "21:30"]
    let tabVicenteDetalheSab = [" ", " ", " ", " ", " ", " "]
    let tabVicenteHoraDom = ["08:00", "13:00", "16:00"]
    let tabVicenteDetalheDom = [" ", " ", " "]
    
    let tabPedraHoraSeg = ["07:00", "11:00", "15:00", "17:00"]
    let tabPedraDetalheSeg = ["Saida de Terra Preta", "Saida de Terra Preta", "Saida de Terra Preta", "Saida de Terra Preta"]
    let tabPedraHoraSab = ["07:00", "12:00", "16:00"]
    let tabPedraDetalheSab = ["Saida de Terra Preta", "Saida de Terra Preta", "Saida de Terra Preta"]
    let tabPedraHoraDom = ["07:00", "12:00"]
    let tabPedraDetalheDom = ["Saida de Terra Preta", "Saida de Terra Preta"]
    
    let tabLagoaHoraSeg = ["06:25", "12:20", "18:20"]
    let tabLagoaDetalheSeg = ["Saida de Terra Preta", "Saida de Terra Preta", "Saida de Terra Preta"]
    let tabLagoaHoraSab = [" "]
    let tabLagoaDetalheSab = [ "Não circula aos Sábados"]
    let tabLagoaHoraDom = [" "]
    let tabLagoaDetalheDom = [ "Não circula aos Domingos"]
    
    let tabRemedioHoraSeg = ["05:45", "08:00", "11:20", "12:40", "16:30", "17:30", "18:30"]
    let tabRemedioDetalheSeg = [" ", " ", " ", " ", " ", " ", " "]
    let tabRemedioHoraSab = ["05:45", "08:00", "11:30", "15:00", "18:20"]
    let tabRemedioDetalheSab = [" ", " ", " ", " ", " "]
    let tabRemedioHoraDom = ["08:00", "11:00", "17:00"]
    let tabRemedioDetalheDom = [" ", " ", " "]
    
    let tabPrainhaHoraSeg = ["06:20", "07:30", "08:30", "09:30", "10:30", "11:30", "12:30", "13:30", "14:30", "15:30", "16:30", "17:30", "18:30", "19:30"]
    let tabPrainhaDetalheSeg = [" ", " ", "Vila Davi", " ", " ", " ", " ", " ", " ", " ", " ", " ", "Volta Via Melchior", "Estrada das Lavras"]
    let tabPrainhaHoraSab = ["05:30", "06:30", "07:30", "08:30", "09:30", "10:30", "11:30", "12:30", "13:30", "14:30", "15:30", "16:30", "17:30", "18:30", "19:30"]
    let tabPrainhaDetalheSab = [" ", "Vila Davi", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " "]
    let tabPrainhaHoraDom = [" "]
    let tabPrainhaDetalheDom = [ "Não circula aos Domingos"]

    
    let tabSabespHoraSeg = ["04:40", "05:20", "05:45", "09:00", "10:05", "11:00", "15:00", "16:00", "17:00", "20:30", "21:30", "22:50"]
    let tabSabespDetalheSeg = [" ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " "]
    let tabSabespHoraSab = ["06:00", "07:00", "08:00", "09:00", "10:00", "11:00", "12:00", "13:00", "14:00", "15:00", "16:00", "17:00", "18:00", "19:00", "20:00", "21:30", "22:30"]
    let tabSabespDetalheSab = [" ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " "]
    let tabSabespHoraDom = ["06:00", "07:00", "08:00", "09:00", "10:00", "11:00", "12:00", "13:00", "14:00", "15:00", "16:00", "17:00", "18:00", "19:00", "20:00", "21:30", "22:30"]
    let tabSabespDetalheDom = [" ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " "]
    
    let tabRioHoraSeg = [ "06:20", "06:40", "07:20", "08:00", "08:40", "09:20", "10:00", "10:40", "11:20", "12:00", "12:40", "13:20", "14:00", "14:40", "15:20", "16:00", "16:40", "17:10", "17:30", "18:00", "18;30", "18:40", "19:20", "20:00", "20:40", "21:20", "22:00", "23:00", "23:50"]
    let tabRioDetalheSeg = ["Ponte Alta - Dia Letivo", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", "Via Remédio"]
    let tabRioHoraSab = ["06:00", "07:10", "08:20", "08:50", "09:30", "10:00", "10:40", "11:10", "12:00", "12:40", "13:10", "13:50", "14:20", "15:00", "15:30", "16:10", "16:40", "17:20", "18:00", "18:40", "19:15", "20:30", "22:00"]
    let tabRioDetalheSab = [" ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " "]
    let tabRioHoraDom = ["06:00", "07:10", "08:20", "09:30", "10:40", "12:00", "13:10", "14:20", "15:30", "16:40", "18:00", "19:15", "20:30", "22:00"]
    let tabRioDetalheDom = [" ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " "]
    
    let tabPetropolisHoraSeg = ["05:45", "06:00", "06:40", "06:55", "07:00", "07:20", "07:45", "08:25", "09:05", "09:30", "10:10", "10:50", "11:15", "11:55", "12:35", "13:00", "13:40", "14:20", "14:45", "15:25", "16:05", "16:40", "17:10", "17:40", "17:50", "18:15", "18:55", "19:35", "20:00", "21:00", "22:00", "22:40", "23:30"]
    let tabPetropolisDetalheSeg = [" ", " ", " ", "Via Apolinário", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", "Via Apolinário", " ", " ", " ", " ", " ", "Via Apolinário", " ", " ", " ", " ", " ", " ", " ", "Via Apolinário", " ", " ", " "]
    let tabPetropolisHoraSab = ["06:00", "07:30", "08:00", "08:30", "09:00", "09:30", "10:00", "10:30", "11:00", "11:30", "12:00", "12:30", "13:00", "13:30", "14:00", "14:30", "15:00", "15:30", "16:00", "16:30", "17:00", "17:30", "18:00", "19:50", "20:40"]
    let tabPetropolisDetalheSab = [" ", "Via Apolinário", "Via Apolinário", " ", " ", " ", "Via Apolinário", " ", " ", " ", " ", " ", " ", " ", "Via Apolinário", " ", " ", " ", "Via Apolinário", " ", "Via Apolinário", " ", " ", " ", " "]
    let tabPetropolisHoraDom = ["06:00", "07:25", "08:30", "08:50", "09:55", "10:15", "11:20", "12:45", "14:10", "15:05", "15:35", "16:30", "17:00", "17:55", "19:50", "20:40"]
    let tabPetropolisDetalheDom = [" ", "Via Apolinário", " ", " ", "Via Apolinário", " ", " ", " ", "Via Apolinário", " ", " ", " ", "Via Apolinário", " ", " ", "Via Sausalito"]
    
    let tabSausalitoHoraSeg = ["05:30", "06:55", "08:00", "09:35", "09:45", "11:30", "12:10", "12:25", "13:15", "14:30", "15:00", "16:00", "16:45", "17:30", "18:30", "19:00", "20:05", "21:30", "23:30"]
    let tabSausalitoDetalheSeg = ["Caraguatá", "Estrada do Governo", "Caraguatá", " ", "Caraguatá", "Caraguatá", " ", "Caraguatá", "Caraguatá", " ", "Caraguatá", " ", "Caraguatá", " ", "Caraguatá", " ", "Caraguatá", "Via Apolinário", " ", " ", " ", " ", " ", "Via Apolinário", " ", " ", " ", "Circular - Dia Letivo", " ", " ", " ", " ", "Via Apolinário", " ", "Via Sausalito", " ", "Dia letivo"]
    let tabSausalitoHoraSab = ["05:30", "06:55", "08:45", "10:15", "11:40", "13:15", "14:45", "16:15", "17:45", "19:15", "20:45"]
    let tabSausalitoDetalheSab = ["Caraguatá", "Franco da Rocha", "Caraguatá", " ", "Caraguatá", " ", " ", "Caraguatá", " ", " ", " "]
    let tabSausalitoHoraDom = ["05:30", "07:05", "11:40", "13:40", "17:30", "18:25", "19:20"]
    let tabSausalitoDetalheDom = [" ", "Caraguatá", "Caraguatá", "Caraguatá", " ", "Caraguatá", " "]

    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        lblNomeLinha.text = nomeDaLinha
        
        // vwPropaganda.image = propaganda
        vwPropaganda.image = (UIImage(named: "Anuncie.jpg"))
        delay(3.0) {
        self.vwPropaganda.image = (UIImage(named: "rede-mairipora.jpg"))
       }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MunicipalCell", for: indexPath) as! MunicipalTableViewCell
        

        switch nomeDaLinha {
        case "Apolinário" :
            if dia == "Seg" {
                cell.lblMunicipalHora.text = tabApolinarioHoraSeg [indexPath.row]
                cell.lblMunicipalDetalhe.text = tabApolinarioDetalheSeg [indexPath.row] }
            else if dia == "Sab" {
                cell.lblMunicipalHora.text = tabApolinarioHoraSab [indexPath.row]
                cell.lblMunicipalDetalhe.text = tabApolinarioDetalheSab [indexPath.row] }
            else if dia == "Dom" {
                cell.lblMunicipalHora.text = tabApolinarioHoraDom [indexPath.row]
                cell.lblMunicipalDetalhe.text = tabApolinarioDetalheDom [indexPath.row] }
        case "Barreiro" :
            if dia == "Seg" {
                cell.lblMunicipalHora.text = tabBarreiroHoraSeg [indexPath.row]
                cell.lblMunicipalDetalhe.text = tabBarreiroDetalheSeg [indexPath.row] }
            else if dia == "Sab" {
                cell.lblMunicipalHora.text = tabBarreiroHoraSab [indexPath.row]
                cell.lblMunicipalDetalhe.text = tabBarreiroDetalheSab [indexPath.row] }
            else if dia == "Dom" {
                cell.lblMunicipalHora.text = tabBarreiroHoraDom [indexPath.row]
                cell.lblMunicipalDetalhe.text = tabBarreiroDetalheDom [indexPath.row] }
        case "Boa Vista" :
            if dia == "Seg" {
                cell.lblMunicipalHora.text = tabBoaVistaHoraSeg [indexPath.row]
                cell.lblMunicipalDetalhe.text = tabBoaVistaDetalheSeg [indexPath.row] }
            else if dia == "Sab" {
                cell.lblMunicipalHora.text = tabBoaVistaHoraSab [indexPath.row]
                cell.lblMunicipalDetalhe.text = tabBoaVistaDetalheSab [indexPath.row] }
            else if dia == "Dom" {
                cell.lblMunicipalHora.text = tabBoaVistaHoraDom [indexPath.row]
                cell.lblMunicipalDetalhe.text = tabBoaVistaDetalheDom [indexPath.row] }
        case "Cacéia" :
            if dia == "Seg" {
                cell.lblMunicipalHora.text = tabCaceiaHoraSeg [indexPath.row]
                cell.lblMunicipalDetalhe.text = tabCaceiaDetalheSeg [indexPath.row] }
            else if dia == "Sab" {
                cell.lblMunicipalHora.text = tabCaceiaHoraSab [indexPath.row]
                cell.lblMunicipalDetalhe.text = tabCaceiaDetalheSab [indexPath.row] }
            else if dia == "Dom" {
                cell.lblMunicipalHora.text = tabCaceiaHoraDom [indexPath.row]
                cell.lblMunicipalDetalhe.text = tabCaceiaDetalheDom [indexPath.row] }
        case "Capim Branco" :
            if dia == "Seg" {
                cell.lblMunicipalHora.text = tabCapimHoraSeg [indexPath.row]
                cell.lblMunicipalDetalhe.text = tabCapimDetalheSeg [indexPath.row] }
            else if dia == "Sab" {
                cell.lblMunicipalHora.text = tabCapimHoraSab [indexPath.row]
                cell.lblMunicipalDetalhe.text = tabCapimDetalheSab [indexPath.row] }
            else if dia == "Dom" {
                cell.lblMunicipalHora.text = tabCapimHoraDom [indexPath.row]
                cell.lblMunicipalDetalhe.text = tabCapimDetalheDom [indexPath.row] }
        case "Capoavinha" :
            if dia == "Seg" {
                cell.lblMunicipalHora.text = tabCapoavinhaHoraSeg [indexPath.row]
                cell.lblMunicipalDetalhe.text = tabCapoavinhaDetalheSeg [indexPath.row] }
            else if dia == "Sab" {
                cell.lblMunicipalHora.text = tabCapoavinhaHoraSab [indexPath.row]
                cell.lblMunicipalDetalhe.text = tabCapoavinhaDetalheSab [indexPath.row] }
            else if dia == "Dom" {
                cell.lblMunicipalHora.text = tabCapoavinhaHoraDom [indexPath.row]
                cell.lblMunicipalDetalhe.text = tabCapoavinhaDetalheDom [indexPath.row] }
            
        case "Cinco Lagos" :
            if dia == "Seg" {
                cell.lblMunicipalHora.text = tabLagosHoraSeg [indexPath.row]
                cell.lblMunicipalDetalhe.text = tabLagosDetalheSeg [indexPath.row] }
            else if dia == "Sab" {
                cell.lblMunicipalHora.text = tabLagosHoraSab [indexPath.row]
                cell.lblMunicipalDetalhe.text = tabLagosDetalheSab [indexPath.row] }
            else if dia == "Dom" {
                cell.lblMunicipalHora.text = tabLagosHoraDom [indexPath.row]
                cell.lblMunicipalDetalhe.text = tabLagosDetalheDom [indexPath.row] }
            
        case "Guavirutuva" :
            if dia == "Seg" {
                cell.lblMunicipalHora.text = tabGuavirutuvaHoraSeg [indexPath.row]
                cell.lblMunicipalDetalhe.text = tabGuavirutuvaDetalheSeg [indexPath.row] }
            else if dia == "Sab" {
                cell.lblMunicipalHora.text = tabGuavirutuvaHoraSab [indexPath.row]
                cell.lblMunicipalDetalhe.text = tabGuavirutuvaDetalheSab [indexPath.row] }
            else if dia == "Dom" {
                cell.lblMunicipalHora.text = tabGuavirutuvaHoraDom [indexPath.row]
                cell.lblMunicipalDetalhe.text = tabGuavirutuvaDetalheDom [indexPath.row] }
            
        case "Hortolândia" :
            if dia == "Seg" {
                cell.lblMunicipalHora.text = tabHortoHoraSeg [indexPath.row]
                cell.lblMunicipalDetalhe.text = tabHortoDetalheSeg [indexPath.row] }
            else if dia == "Sab" {
                cell.lblMunicipalHora.text = tabHortoHoraSab [indexPath.row]
                cell.lblMunicipalDetalhe.text = tabHortoDetalheSab [indexPath.row] }
            else if dia == "Dom" {
                cell.lblMunicipalHora.text = tabHortoHoraDom [indexPath.row]
                cell.lblMunicipalDetalhe.text = tabHortoDetalheDom [indexPath.row] }
            
        case "Jardim da Lagoa" :
            if dia == "Seg" {
                cell.lblMunicipalHora.text = tabLagoaHoraSeg [indexPath.row]
                cell.lblMunicipalDetalhe.text = tabLagoaDetalheSeg [indexPath.row] }
            else if dia == "Sab" {
                cell.lblMunicipalHora.text = tabLagoaHoraSab [indexPath.row]
                cell.lblMunicipalDetalhe.text = tabLagoaDetalheSab [indexPath.row] }
            else if dia == "Dom" {
                cell.lblMunicipalHora.text = tabLagoaHoraDom [indexPath.row]
                cell.lblMunicipalDetalhe.text = tabLagoaDetalheDom [indexPath.row] }
            
        case "Marmelo" :
            if dia == "Seg" {
                cell.lblMunicipalHora.text = tabMarmeloHoraSeg [indexPath.row]
                cell.lblMunicipalDetalhe.text = tabMarmeloDetalheSeg [indexPath.row] }
            else if dia == "Sab" {
                cell.lblMunicipalHora.text = tabMarmeloHoraSab [indexPath.row]
                cell.lblMunicipalDetalhe.text = tabMarmeloDetalheSab [indexPath.row] }
            else if dia == "Dom" {
                cell.lblMunicipalHora.text = tabMarmeloHoraDom [indexPath.row]
                cell.lblMunicipalDetalhe.text = tabMarmeloDetalheDom [indexPath.row] }
            
        case "Mato Dentro" :
            if dia == "Seg" {
                cell.lblMunicipalHora.text = tabMatoHoraSeg [indexPath.row]
                cell.lblMunicipalDetalhe.text = tabMatoDetalheSeg [indexPath.row] }
            else if dia == "Sab" {
                cell.lblMunicipalHora.text = tabMatoHoraSab [indexPath.row]
                cell.lblMunicipalDetalhe.text = tabMatoDetalheSab [indexPath.row] }
            else if dia == "Dom" {
                cell.lblMunicipalHora.text = tabMatoHoraDom [indexPath.row]
                cell.lblMunicipalDetalhe.text = tabMatoDetalheDom [indexPath.row] }
        case "Pedra Vermelha" :
            if dia == "Seg" {
                cell.lblMunicipalHora.text = tabPedraHoraSeg [indexPath.row]
                cell.lblMunicipalDetalhe.text = tabPedraDetalheSeg [indexPath.row] }
            else if dia == "Sab" {
                cell.lblMunicipalHora.text = tabPedraHoraSab [indexPath.row]
                cell.lblMunicipalDetalhe.text = tabPedraDetalheSab [indexPath.row] }
            else if dia == "Dom" {
                cell.lblMunicipalHora.text = tabPedraHoraDom [indexPath.row]
                cell.lblMunicipalDetalhe.text = tabPedraDetalheDom [indexPath.row] }
            
        case "Pedreira" :
            if dia == "Seg" {
                cell.lblMunicipalHora.text = tabPedreiraHoraSeg [indexPath.row]
                cell.lblMunicipalDetalhe.text = tabPedreiraDetalheSeg [indexPath.row] }
            else if dia == "Sab" {
                cell.lblMunicipalHora.text = tabPedreiraHoraSab [indexPath.row]
                cell.lblMunicipalDetalhe.text = tabPedreiraDetalheSab [indexPath.row] }
            else if dia == "Dom" {
                cell.lblMunicipalHora.text = tabPedreiraHoraDom [indexPath.row]
                cell.lblMunicipalDetalhe.text = tabPedreiraDetalheDom [indexPath.row] }
            
        case "Petrópolis – Alpes" :
            if dia == "Seg" {
                cell.lblMunicipalHora.text = tabPetropolisHoraSeg [indexPath.row]
                cell.lblMunicipalDetalhe.text = tabPetropolisDetalheSeg [indexPath.row] }
            else if dia == "Sab" {
                cell.lblMunicipalHora.text = tabPetropolisHoraSab [indexPath.row]
                cell.lblMunicipalDetalhe.text = tabPetropolisDetalheSab [indexPath.row] }
            else if dia == "Dom" {
                cell.lblMunicipalHora.text = tabPetropolisHoraDom [indexPath.row]
                cell.lblMunicipalDetalhe.text = tabPetropolisDetalheDom [indexPath.row] }
            
        case "Petrópolis – Sausalito" :
            if dia == "Seg" {
                cell.lblMunicipalHora.text = tabSausalitoHoraSeg [indexPath.row]
                cell.lblMunicipalDetalhe.text = tabSausalitoDetalheSeg [indexPath.row] }
            else if dia == "Sab" {
                cell.lblMunicipalHora.text = tabSausalitoHoraSab [indexPath.row]
                cell.lblMunicipalDetalhe.text = tabSausalitoDetalheSab [indexPath.row] }
            else if dia == "Dom" {
                cell.lblMunicipalHora.text = tabSausalitoHoraDom [indexPath.row]
                cell.lblMunicipalDetalhe.text = tabSausalitoDetalheDom [indexPath.row] }
            
        case "Prainha" :
            if dia == "Seg" {
                cell.lblMunicipalHora.text = tabPrainhaHoraSeg [indexPath.row]
                cell.lblMunicipalDetalhe.text = tabPrainhaDetalheSeg [indexPath.row] }
            else if dia == "Sab" {
                cell.lblMunicipalHora.text = tabPrainhaHoraSab [indexPath.row]
                cell.lblMunicipalDetalhe.text = tabPrainhaDetalheSab [indexPath.row] }
            else if dia == "Dom" {
                cell.lblMunicipalHora.text = tabPrainhaHoraDom [indexPath.row]
                cell.lblMunicipalDetalhe.text = tabPrainhaDetalheDom [indexPath.row] }
            
        case "Remédio" :
            if dia == "Seg" {
                cell.lblMunicipalHora.text = tabRemedioHoraSeg [indexPath.row]
                cell.lblMunicipalDetalhe.text = tabRemedioDetalheSeg [indexPath.row] }
            else if dia == "Sab" {
                cell.lblMunicipalHora.text = tabRemedioHoraSab [indexPath.row]
                cell.lblMunicipalDetalhe.text = tabRemedioDetalheSab [indexPath.row] }
            else if dia == "Dom" {
                cell.lblMunicipalHora.text = tabRemedioHoraDom [indexPath.row]
                cell.lblMunicipalDetalhe.text = tabRemedioDetalheDom [indexPath.row] }
            
        case "Rio Acima" :
            if dia == "Seg" {
                cell.lblMunicipalHora.text = tabRioHoraSeg [indexPath.row]
                cell.lblMunicipalDetalhe.text = tabRioDetalheSeg [indexPath.row] }
            else if dia == "Sab" {
                cell.lblMunicipalHora.text = tabRioHoraSab [indexPath.row]
                cell.lblMunicipalDetalhe.text = tabRioDetalheSab [indexPath.row] }
            else if dia == "Dom" {
                cell.lblMunicipalHora.text = tabRioHoraDom [indexPath.row]
                cell.lblMunicipalDetalhe.text = tabRioDetalheDom [indexPath.row] }
            
        case "Sabesp" :
            if dia == "Seg" {
                cell.lblMunicipalHora.text = tabSabespHoraSeg [indexPath.row]
                cell.lblMunicipalDetalhe.text = tabSabespDetalheSeg [indexPath.row] }
            else if dia == "Sab" {
                cell.lblMunicipalHora.text = tabSabespHoraSab [indexPath.row]
                cell.lblMunicipalDetalhe.text = tabSabespDetalheSab [indexPath.row] }
            else if dia == "Dom" {
                cell.lblMunicipalHora.text = tabSabespHoraDom [indexPath.row]
                cell.lblMunicipalDetalhe.text = tabSabespDetalheDom [indexPath.row] }
        case "São Vicente" :
            if dia == "Seg" {
                cell.lblMunicipalHora.text = tabVicenteHoraSeg [indexPath.row]
                cell.lblMunicipalDetalhe.text = tabVicenteDetalheSeg [indexPath.row] }
            else if dia == "Sab" {
                cell.lblMunicipalHora.text = tabVicenteHoraSab [indexPath.row]
                cell.lblMunicipalDetalhe.text = tabVicenteDetalheSab [indexPath.row] }
            else if dia == "Dom" {
                cell.lblMunicipalHora.text = tabVicenteHoraDom [indexPath.row]
                cell.lblMunicipalDetalhe.text = tabVicenteDetalheDom [indexPath.row] }
            
        case "Terra Preta" :
            if dia == "Seg" {
                cell.lblMunicipalHora.text = tabTerraHoraSeg [indexPath.row]
                cell.lblMunicipalDetalhe.text = tabTerraDetalheSeg [indexPath.row] }
            else if dia == "Sab" {
                cell.lblMunicipalHora.text = tabTerraHoraSab [indexPath.row]
                cell.lblMunicipalDetalhe.text = tabTerraDetalheSab [indexPath.row] }
            else if dia == "Dom" {
                cell.lblMunicipalHora.text = tabTerraHoraDom [indexPath.row]
                cell.lblMunicipalDetalhe.text = tabTerraDetalheDom [indexPath.row] }

         default:
            cell.lblMunicipalHora.text = "00:00"
            cell.lblMunicipalDetalhe.text = "00:00"
        }

        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        var indice = 0
        
        switch nomeDaLinha {
        case "Apolinário" :
            if dia == "Seg" {
                indice = tabApolinarioHoraSeg.count}
            else if dia == "Sab" {
                indice = tabApolinarioHoraSab.count}
            else if dia == "Dom" {
                indice = tabApolinarioHoraDom.count}
        case "Barreiro" :
            if dia == "Seg" {
                indice = tabBarreiroHoraSeg.count}
            else if dia == "Sab" {
                indice = tabBarreiroHoraSab.count}
            else if dia == "Dom" {
                indice = tabBarreiroHoraDom.count}
        case "Boa Vista" :
            if dia == "Seg" {
                indice = tabBoaVistaHoraSeg.count}
            else if dia == "Sab" {
                indice = tabBoaVistaHoraSab.count}
            else if dia == "Dom" {
                indice = tabBoaVistaHoraDom.count}
        case "Cacéia" :
            if dia == "Seg" {
                indice = tabCaceiaHoraSeg.count}
            else if dia == "Sab" {
                indice = tabCaceiaHoraSab.count}
            else if dia == "Dom" {
                indice = tabCaceiaHoraDom.count}
        case "Capim Branco" :
            if dia == "Seg" {
                indice = tabCapimHoraSeg.count}
            else if dia == "Sab" {
                indice = tabCapimHoraSab.count}
            else if dia == "Dom" {
                indice = tabCapimHoraDom.count}
        case "Capoavinha" :
            if dia == "Seg" {
                indice = tabCapoavinhaHoraSeg.count}
            else if dia == "Sab" {
                indice = tabCapoavinhaHoraSab.count}
            else if dia == "Dom" {
                indice = tabCapoavinhaHoraDom.count}
        case "Cinco Lagos" :
            if dia == "Seg" {
                indice = tabLagosHoraSeg.count}
            else if dia == "Sab" {
                indice = tabLagosHoraSab.count}
            else if dia == "Dom" {
                indice = tabLagosHoraDom.count}
        case "Guavirutuva" :
            if dia == "Seg" {
                indice = tabGuavirutuvaHoraSeg.count}
            else if dia == "Sab" {
                indice = tabGuavirutuvaHoraSab.count}
            else if dia == "Dom" {
                indice = tabGuavirutuvaHoraDom.count}
        case "Hortolândia" :
            if dia == "Seg" {
                indice = tabHortoHoraSeg.count}
            else if dia == "Sab" {
                indice = tabHortoHoraSab.count}
            else if dia == "Dom" {
                indice = tabHortoHoraDom.count}
        case "Jardim da Lagoa" :
            if dia == "Seg" {
                indice = tabLagoaHoraSeg.count}
            else if dia == "Sab" {
                indice = tabLagoaHoraSab.count}
            else if dia == "Dom" {
                indice = tabLagoaHoraDom.count}
        case "Marmelo" :
            if dia == "Seg" {
                indice = tabMarmeloHoraSeg.count}
            else if dia == "Sab" {
                indice = tabMarmeloHoraSab.count}
            else if dia == "Dom" {
                indice = tabMarmeloHoraDom.count}
        case "Mato Dentro" :
            if dia == "Seg" {
                indice = tabMatoHoraSeg.count}
            else if dia == "Sab" {
                indice = tabMatoHoraSab.count}
            else if dia == "Dom" {
                indice = tabMatoHoraDom.count}
        case "Pedra Vermelha" :
            if dia == "Seg" {
                indice = tabPedraHoraSeg.count}
            else if dia == "Sab" {
                indice = tabPedraHoraSab.count}
            else if dia == "Dom" {
                indice = tabPedraHoraDom.count}
        case "Pedreira" :
            if dia == "Seg" {
                indice = tabPedreiraHoraSeg.count}
            else if dia == "Sab" {
                indice = tabPedreiraHoraSab.count}
            else if dia == "Dom" {
                indice = tabPedreiraHoraDom.count}
        case "Petrópolis – Alpes" :
            if dia == "Seg" {
                indice = tabPetropolisHoraSeg.count}
            else if dia == "Sab" {
                indice = tabPetropolisHoraSab.count}
            else if dia == "Dom" {
                indice = tabPetropolisHoraDom.count}
        case "Petrópolis – Sausalito" :
            if dia == "Seg" {
                indice = tabSausalitoHoraSeg.count}
            else if dia == "Sab" {
                indice = tabSausalitoHoraSab.count}
            else if dia == "Dom" {
                indice = tabSausalitoHoraDom.count}
        case "Prainha" :
            if dia == "Seg" {
                indice = tabPrainhaHoraSeg.count}
            else if dia == "Sab" {
                indice = tabPrainhaHoraSab.count}
            else if dia == "Dom" {
                indice = tabPrainhaHoraDom.count}
        case "Remédio" :
            if dia == "Seg" {
                indice = tabRemedioHoraSeg.count}
            else if dia == "Sab" {
                indice = tabRemedioHoraSab.count}
            else if dia == "Dom" {
                indice = tabRemedioHoraDom.count}
        case "Rio Acima" :
            if dia == "Seg" {
                indice = tabRioHoraSeg.count}
            else if dia == "Sab" {
                indice = tabRioHoraSab.count}
            else if dia == "Dom" {
                indice = tabRioHoraDom.count}
        case "Sabesp" :
            if dia == "Seg" {
                indice = tabSabespHoraSeg.count}
            else if dia == "Sab" {
                indice = tabSabespHoraSab.count}
            else if dia == "Dom" {
                indice = tabSabespHoraDom.count}
        case "São Vicente" :
            if dia == "Seg" {
                indice = tabVicenteHoraSeg.count}
            else if dia == "Sab" {
                indice = tabVicenteHoraSab.count}
            else if dia == "Dom" {
                indice = tabVicenteHoraDom.count}
        case "Terra Preta" :
            if dia == "Seg" {
                indice = tabTerraHoraSeg.count}
            else if dia == "Sab" {
                indice = tabTerraHoraSab.count}
            else if dia == "Dom" {
                indice = tabTerraHoraDom.count}
        default:
                indice = 0
        }
  
        return indice
       
    }
    @IBAction func sgcDiaDaSemana(_ sender: UISegmentedControl) {
        
        switch (sender.selectedSegmentIndex) {
        case 0:
            dia = "Seg"
        case 1:
            dia = "Sab"
        case 2:
            dia = "Dom"
        default:
            dia = ""
            
        }
        tblMunicipal.reloadData()
    }
    
    func delay(_ delay: Double, closure: @escaping ()->()) {
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + Double(Int64(delay * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC),
        execute: closure )
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
