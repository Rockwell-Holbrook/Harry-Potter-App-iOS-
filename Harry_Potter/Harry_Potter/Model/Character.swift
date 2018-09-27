// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

typealias Characters = [WelcomeElement]

struct WelcomeElement: Decodable {
    let id, name: String
    let role: String?
    let house: House?
    let school: School?
    let v: Int
    let ministryOfMagic, orderOfThePhoenix, dumbledoresArmy, deathEater: Bool
    let bloodStatus: BloodStatus
    let species: String
    let boggart, alias, animagus, wand: String?
    let patronus: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case name, role, house, school
        case v = "__v"
        case ministryOfMagic, orderOfThePhoenix, dumbledoresArmy, deathEater, bloodStatus, species, boggart, alias, animagus, wand, patronus
    }
}

enum BloodStatus: String, Decodable {
    case halfBlood = "half-blood"
    case halfGiant = "half-giant"
    case muggle = "muggle"
    case muggleBorn = "muggle-born"
    case pureBlood = "pure-blood"
    case quarterVilla = "quarter-villa"
    case squib = "squib"
    case unknown = "unknown"
}

enum House: String, Decodable {
    case gryffindor = "Gryffindor"
    case hufflepuff = "Hufflepuff"
    case ravenclaw = "Ravenclaw"
    case slytherin = "Slytherin"
}

enum School: String, Decodable {
    case beauxbatonsAcademyOfMagic = "Beauxbatons Academy of Magic"
    case durmstrangInstitute = "Durmstrang Institute"
    case hogwartsAcademyOfWitchcraftAndWizardry = "Hogwarts Academy of Witchcraft and Wizardry"
    case hogwartsSchoolOfWitchcraftAndWizardry = "Hogwarts School of Witchcraft and Wizardry"
}
