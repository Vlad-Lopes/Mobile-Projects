//
//  countryModel.swift
//  CovInfo
//
//  Created by Vlad Lopes on 08/04/20.
//  Copyright © 2020 Vlad Lopes. All rights reserved.
//

import Foundation

 let countryArray = ["**", "Total Global", "AD","Andorra", "AE","Emirados Árabes Unidos", "AG","Antígua e Barbuda", "AI","Anguilla", "AL","Albânia", "AM","Armênia", "AN","Antilhas Holandesas", "AO","Angola", "AQ","Antartica", "AR","Argentina", "AS","Samoa Americana", "AT","Áustria", "AU","Austrália", "AW","Aruba", "AZ","Azerbaidjão", "BA","Bósnia e Herzegóvina", "BB","Barbados", "BD","Bangladesh", "BE","Bélgica", "BF","Burkina Faso", "BG","Bulgária", "BH","Barein", "BI","Burundi", "BJ","Benin", "BM","Bermudas", "BN","Brunei", "BO","Bolívia ", "BR","Brasil", "BS","Bahamas", "BT","Butão", "BV","Ilha Bouvet", "BW","Botswana", "BY","Belarus", "BZ","Belize", "CA","Canadá", "CC","Ilhas Cocos", "CD","República Dem. Do Congo", "CF","República Centro Africana", "CG","Congo", "CH","Suíça", "CI","Costa do Marfim", "CK","Ilhas Cook ", "CL","Chile", "CM","Camarões", "CN","China", "CO","Colômbia", "CR","Costa Rica", "CU","Cuba", "CV","Cabo Verde", "CX","Ilha Natal", "CY","Chipre", "CZ","República Tcheca", "DE","Alemanha", "DJ","Djibuti", "DK","Dinamarca", "DM","Dominica", "DO","República Dominicana", "DZ","Argélia", "EC","Equador", "EE","Estônia", "EG","Egito", "EH","Saara Ocidental", "ER","Eritréia", "ES","Espanha", "ET","Etiópia", "AF","Afeganistão", "FI","Finlândia", "FJ","Fiji", "FK","Ilhas Malvinas", "FM","Micronésia", "FO","Ilhas Faroe", "FR","França", "GA","Gabão", "GB","Reino Unido", "GD","Granada", "GE","Geórgia", "GH","Gana", "GI","Gibraltar", "GL","Groenlândia", "GM","Gambia", "GN","Guine", "GP","Guadalupe", "GQ","Guine Equatorial", "GR","Grécia", "GS","Geórgia do Sul", "GT","Guatemala", "GU","Guam", "GW","Guiné Bissau", "GY","Guiana", "HK","Hong-Kong", "HM","Ilhas Heard e McDonald", "HN","Honduras", "HR","Croácia", "HT","Haiti", "HU","Hungria", "ID","Indonésia", "IE","Irlanda", "IL","Israel", "IM","Ilha do Homem", "IN","India", "IQ","Iraque", "IR","Irã", "IS","Islândia", "IT","Itália", "JE","Jersey", "JM","Jamaica", "JO","Jordânia", "JP","Japão", "KE","Quênia", "KG","Quirguistão", "KH","Camboja", "KI","Kiribati", "KM","Comores", "KN","São Cristovão e Nevis", "KP","Coréia do Norte", "KR","Coréia do Sul", "KW","Kuwait", "KY","Ilhas Cayman", "KZ","Cazaquistão", "LA","Laos", "LB","Líbano", "LC","Santa Lúcia", "LI","Liechtenstein", "LK","Sri Lanka", "LR","Libéria", "LS","Lesoto", "LT","Lituânia", "LU","Luxemburgo", "LV","Letônia", "LY","Líbia", "MA","Marrocos", "MC","Mônaco", "MD","Moldavia", "ME","Montenegro", "MG","Madagascar", "MH","Ilhas Marshall", "MK","Macedonia", "ML","Mali", "MM","Mianmar", "MN","Mongólia", "MO","Macau", "MP","Ilhas Marianas do Norte", "MQ","Martinica", "MR","Mauritânia", "MS","Mont Serrat", "MT","Malta", "MU","Maurício", "MV","Maldivas", "MW","Malawi", "MX","México", "MY","Malásia", "MZ","Moçambique", "NA","Namíbia", "NC","Nova Caledônia", "NE","Níger", "NF","Ilha Norfalk", "NG","Nigéria", "NI","Nicarágua", "NL","Holanda", "NO","Noruega", "NP","Nepal", "NR","Nauru", "NZ","Nova Zelândia", "OM","Omã", "PA","Panamá", "PE","Peru", "PF","Polinésia Francesa", "PG","Papua Nova Guiné", "PH","Filipinas", "PK","Paquistão", "PL","Polônia", "PM","Saint Pierre e Miquelon", "PN","Pitcairn", "PR","Porto Rico", "PT","Portugal", "PW","Palau", "PY","Paraguai", "QA","Catar", "RE","Reunião", "RO","Romênia", "RS","Sérvia", "RU","Russia", "RW","Ruanda", "SA","Arábia Saudita", "SB","Ilhas Salomão", "SC","Seychelles", "SD","Sudão", "SE","Suécia", "SG","Singapura", "SH","Santa Helena", "SI","Eslovenia", "SJ","Svalbard e Jan Mayen", "SK","Eslováquia", "SL","Serra Leoa", "SM","São Marino", "SN","Senegal", "SO","Somália", "SR","Suriname", "ST","São Tomé e Príncipe", "SV","El Salvador", "SY","Síria", "SZ","Suazilândia", "TC","Ilhas Turks e Caicos", "TD","Chade", "TG","Togo", "TH","Tailândia", "TJ","Tadjiquistão", "TK","Tokelau", "TL","Timor-Leste", "TM","Turcomenistão", "TN","Tunísia", "TO","Tonga", "TR","Turquia", "TT","Trinidad e Tobago", "TV","Tuvalu", "TW","Taiwan", "TZ","Tanzânia", "UA","Ucrânia", "UG","Uganda", "UM","Ilhas Menores ", "US","Estados Unidos da América", "UY","Uruguai", "UZ","Uzbequistão", "VA","Vaticano", "VC","São Vicente e Granadinas", "VE","Venezuela", "VG","Ilhas Virgens (Britânicas)", "VI","Ilhas Virgens (U.S.)", "VN","Vietnã", "VU","Vanuatu", "WS","Samoa Ocidental", "YE","Iêmen ", "YU","Yugoslávia", "ZA","Africa do Sul", "ZM","Zâmbia", "ZR","Zaire", "ZW","Zimbábue"]

struct CountryModel {
    let inputValue : String
 
    var countryInitial : String {
        if inputValue.count == 2 {
            return inputValue
        } else {
            let index = countryArray.firstIndex(of: inputValue) ?? 1
            return countryArray[index - 1]
            }
    }
    
    var countryName : String {
        if inputValue.count == 2 {
            let index = countryArray.firstIndex(of: inputValue.uppercased()) ?? 0
            return countryArray[index + 1]
        } else {
            return inputValue
            }
    }
}
