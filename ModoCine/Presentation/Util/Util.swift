//
//  Util.swift
//  ModoCine
//
//  Created by Fernando Moreno on 14/04/2025.
//

import Foundation

func formattedReleaseDate(from dateString: String) -> String {
    let inputFormatter = DateFormatter()
    inputFormatter.dateFormat = "yyyy-MM-dd"
    inputFormatter.locale = Locale(identifier: "en_US_POSIX")

    let outputFormatter = DateFormatter()
    outputFormatter.dateFormat = "dd-MM-yyyy"
    outputFormatter.locale = Locale(identifier: "en_US_POSIX")

    if let date = inputFormatter.date(from: dateString) {
        return outputFormatter.string(from: date)
    } else {
        return "Fecha desconocida"
    }
}

func formatBirthday(_ birthday: String?, deathday: String?) -> String {
    guard let birthday = birthday else { return "Fecha desconocida" }
    
    let inputFormatter = DateFormatter()
    inputFormatter.dateFormat = "yyyy-MM-dd"
    inputFormatter.locale = Locale(identifier: "es_ES")
    
    guard let birthDate = inputFormatter.date(from: birthday) else {
        return "Fecha inválida"
    }
    
    let outputFormatter = DateFormatter()
    outputFormatter.locale = Locale(identifier: "es_ES")
    outputFormatter.dateFormat = "d 'de' MMMM 'de' yyyy"
    
    let formattedBirthDate = outputFormatter.string(from: birthDate)
    
    // Si el actor falleció, en fecha de nacimiento solo mostramos la fecha, sin edad
    if let deathday = deathday, !deathday.isEmpty {
        return formattedBirthDate
    }
    
    // Si no falleció, calculamos edad actual
    let calendar = Calendar.current
    let now = Date()
    let ageComponents = calendar.dateComponents([.year], from: birthDate, to: now)
    let age = ageComponents.year ?? 0
    
    let ageText = age == 1 ? "\(age) año" : "\(age) años"
    
    return "\(formattedBirthDate) (\(ageText))"
}

func formatDeathday(_ deathday: String?, birthday: String?) -> String? {
    guard let deathday = deathday, !deathday.isEmpty else { return nil }
    guard let birthday = birthday else { return nil }
    
    let inputFormatter = DateFormatter()
    inputFormatter.dateFormat = "yyyy-MM-dd"
    inputFormatter.locale = Locale(identifier: "es_ES")
    
    guard let deathDate = inputFormatter.date(from: deathday),
          let birthDate = inputFormatter.date(from: birthday) else {
        return nil
    }
    
    let outputFormatter = DateFormatter()
    outputFormatter.locale = Locale(identifier: "es_ES")
    outputFormatter.dateFormat = "d 'de' MMMM 'de' yyyy"
    
    let formattedDeathDate = outputFormatter.string(from: deathDate)
    
    // Calcular edad al momento de fallecer
    let calendar = Calendar.current
    let ageComponents = calendar.dateComponents([.year], from: birthDate, to: deathDate)
    let ageAtDeath = ageComponents.year ?? 0
    
    let ageText = ageAtDeath == 1 ? "\(ageAtDeath) año" : "\(ageAtDeath) años"
    
    return "\(formattedDeathDate) (\(ageText))"
}

func languageTransform(_ code: String) -> String {
    switch code {
    case "aa": return "afar"
    case "ab": return "abjasiano"
    case "ae": return "avéstico"
    case "af": return "afrikáans"
    case "ak": return "akano"
    case "am": return "amhárico"
    case "an": return "aragonés"
    case "ar": return "árabe"
    case "as": return "asamés"
    case "av": return "ávaro"
    case "ay": return "aimara"
    case "az": return "azerí"
    case "ba": return "baskir"
    case "be": return "bielorruso"
    case "bg": return "búlgaro"
    case "bh": return "bhoyapurí"
    case "bi": return "bislama"
    case "bm": return "bambara"
    case "bn": return "bengalí"
    case "bo": return "tibetano"
    case "br": return "bretón"
    case "bs": return "bosnio"
    case "ca": return "catalán"
    case "ce": return "checheno"
    case "ch": return "chamorro"
    case "co": return "corso"
    case "cr": return "cree"
    case "cs": return "checo"
    case "cu": return "eslavo eclesiástico antiguo"
    case "cv": return "chuvasio"
    case "cy": return "galés"
    case "da": return "danés"
    case "de": return "alemán"
    case "dv": return "maldivo (o dhivehi)"
    case "dz": return "dzongkha"
    case "ee": return "ewé"
    case "el": return "griego (moderno)"
    case "en": return "inglés"
    case "eo": return "esperanto"
    case "es": return "español"
    case "et": return "estonio"
    case "eu": return "euskera"
    case "fa": return "persa"
    case "ff": return "fula"
    case "fi": return "finlandés"
    case "fj": return "fiyiano"
    case "fo": return "feroés"
    case "fr": return "francés"
    case "fy": return "frisón"
    case "ga": return "irlandés"
    case "gd": return "gaélico"
    case "gl": return "gallego"
    case "gn": return "guaraní"
    case "gu": return "guyaratí"
    case "gv": return "manés"
    case "ha": return "hausa"
    case "he": return "hebreo"
    case "hi": return "hindú"
    case "ho": return "hiri motu"
    case "hr": return "croata"
    case "ht": return "haitiano"
    case "hu": return "húngaro"
    case "hy": return "armenio"
    case "hz": return "herero"
    case "ia": return "interlingua"
    case "id": return "indonesio"
    case "ie": return "occidental"
    case "ig": return "igbo"
    case "ii": return "yi de Sichuán"
    case "ik": return "iñupiaq"
    case "io": return "ido"
    case "is": return "islandés"
    case "it": return "italiano"
    case "iu": return "inuktitut"
    case "ja": return "japonés"
    case "jv": return "javanés"
    case "ka": return "georgiano"
    case "kg": return "kongo"
    case "ki": return "kikuyu"
    case "kj": return "kuanyama"
    case "kk": return "kazajo"
    case "kl": return "groenlandés"
    case "km": return "camboyano"
    case "kn": return "canarés"
    case "ko": return "coreano"
    case "kr": return "kanuri"
    case "ks": return "cachemiro"
    case "ku": return "kurdo"
    case "kv": return "komi"
    case "kw": return "córnico"
    case "ky": return "kirguís"
    case "la": return "latín"
    case "lb": return "luxemburgués"
    case "lg": return "luganda"
    case "li": return "limburgués"
    case "ln": return "lingala"
    case "lo": return "lao"
    case "lt": return "lituano"
    case "lu": return "chiluba"
    case "lv": return "letón"
    case "mg": return "malgache"
    case "mh": return "marshalés"
    case "mi": return "maorí"
    case "mk": return "macedonio"
    case "ml": return "malayalam"
    case "mn": return "mongol"
    case "mr": return "maratí"
    case "ms": return "malayo"
    case "mt": return "maltés"
    case "my": return "birmano"
    case "na": return "nauruano"
    case "nb": return "noruego"
    case "nd": return "ndebele del norte"
    case "ne": return "nepalí"
    case "ng": return "ndonga"
    case "nl": return "holandés"
    case "nn": return "nynorsk"
    case "no": return "noruego"
    case "nr": return "ndebele del sur"
    case "nv": return "navajo"
    case "ny": return "chichewa"
    case "oc": return "occitano"
    case "oj": return "ojibwa"
    case "om": return "oromo"
    case "or": return "oriya"
    case "os": return "osético"
    case "pa": return "panyabí"
    case "pi": return "pali"
    case "pl": return "polaco"
    case "ps": return "pastú"
    case "pt": return "portugués"
    case "qu": return "quechua"
    case "rm": return "romanche"
    case "rn": return "kirundi"
    case "ro": return "rumano"
    case "ru": return "ruso"
    case "rw": return "ruandés"
    case "sa": return "sánscrito"
    case "sc": return "sardo"
    case "sd": return "sindhi"
    case "se": return "sami septentrional"
    case "sg": return "sango"
    case "si": return "cingalés"
    case "sk": return "eslovaco"
    case "sl": return "esloveno"
    case "sm": return "samoano"
    case "sn": return "shona"
    case "so": return "somalí"
    case "sq": return "albanés"
    case "sr": return "serbio"
    case "ss": return "suazi"
    case "st": return "sesotho"
    case "su": return "sundanés"
    case "sv": return "sueco"
    case "sw": return "suajili"
    case "ta": return "tamil"
    case "te": return "télugu"
    case "tg": return "tayiko"
    case "th": return "tailandés"
    case "ti": return "tigriña"
    case "tk": return "turcomano"
    case "tl": return "tagalo"
    case "tn": return "setsuana"
    case "to": return "tongano"
    case "tr": return "turco"
    case "ts": return "tsonga"
    case "tt": return "tártaro"
    case "tw": return "twi"
    case "ty": return "tahitiano"
    case "ug": return "uigur"
    case "uk": return "ucraniano"
    case "ur": return "urdu"
    case "uz": return "uzbeko"
    case "ve": return "venda"
    case "vi": return "vietnamita"
    case "vo": return "volapük"
    case "wa": return "valón"
    case "wo": return "wolof"
    case "xh": return "xhosa"
    case "yi": return "yídish"
    case "yo": return "yoruba"
    case "za": return "chuan"
    case "zh": return "chino"
    case "zu": return "zulúo"
    default: return "No Disponible"
    }
}
