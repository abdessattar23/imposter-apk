import '../models/models.dart';

class GameDatabase {
  static final List<Category> categories = [
    Category(
      id: 'makla',
      name: 'Makla (Food)',
      description: 'Lmakla dl mgharba l7orra',
      words: [
        'Bissara', 'Loubia', 'Raib', 'Danone', 'Chwa', 'Lmsmmn', 'L7archa',
        'Zari3a', 'Atay', '9ahwa', 'Couscous', 'Rfissa', 'Tanjia', 'Tajine',
        'Sfenj', 'Baghrir', 'L7am', 'Djej', 'Chlada', 'Za3louk', 'L3dess',
        'L7ommos', 'Taktouka', 'Bakoula', 'Batbout', 'Khobz', 'Frite',
        'Shawarma', 'Tacos', 'Pizza', 'Burger', 'Pastilla', 'Briwat',
        'Chebakia', 'Sellou', 'Lmonada', 'Zit Zitoune', 'Amalou', 'Lben',
        'Hlib', 'Karmouss', 'Hendi', 'Zri3t lkettan', 'Zanjlan', 'Ka3b Ghazal',
        'Ghriba', 'Loz', 'Garga3', 'Kawkaw', 'Tmer', 'Shri7a', 'L7out',
        'Krouvit', 'Calamar', 'Merlan', 'Sardine', 'Kofta', 'Sossiss',
        'Lhem bl bar9o9', 'Flan', 'Zitoun Mchermel', 'L7amed Mssiyer',
        'L7rira', 'Soupa', 'Roz', 'Lgelia', 'Kaskrout', 'Milfoy', 'Croissant',
        'Zabda', 'Konfitir', 'Fermage', 'Kiri', 'Kashir', 'Gass3a', 'Ma9la',
        'Kassrouna', 'Maticha', 'Ker3in', 'Tkalia', 'Boulfaf', 'Ghlal'
      ],
    ),
    Category(
      id: 'lbsala',
      name: 'Lbsala & Objects',
      description: 'Tkhirbi9 w objects dyal dar',
      words: [
        'Mika K7la', 'Cabas', 'Bota Sghira', 'Bota Kbira', 'Jffaf', 'Chataaba',
        'Sandalat Mika', 'Sbbat', 'Tila', 'Tlfaza', 'Sif', 'Mouss', 'Kaskita',
        'Tarbouch', 'T9acher', 'Sandala', 'Brika', 'Serwal 9andrisi',
        'Serwal Jean', 'Zif', 'Foulard', 'Krafata', 'Nwadader', 'Makina d l7sana',
        'Rasoir', 'Pompia', 'Javel', 'Tide', 'Pikalla', 'Tlaja', 'Kouza',
        'M9raj', 'Kas', 'Kisan', 'Sanida', 'Sokkar', 'Tbasel', 'Zlayf',
        'Lmoch', 'Lkelb', 'Saboun lbeldi', 'Saboun d riha', 'Lkessa', 'Lm7akka',
        'Parapluie', 'Jellaba', 'Gondora', '9aftan', 'Blygha', 'Cherbil',
        'Lpila', 'Bola', 'Zzway', 'Lmrayer', 'Camera', 'Lkit', 'Charij',
        'Telfoun', 'Pc', 'Stylo', 'Crayon', 'Goma', 'Ktab', 'Deftar',
        'Cartable', 'Baliza', 'Sarf', 'Bztam', 'Passeport', 'Carte Nationale',
        'Shampooing', 'Pomada', 'Riha', 'Lmejmer', 'Lkanoun', 'Rbouz',
        'Lghorbal', 'Lmehraze', 'Sinia', 'Berrad', 'Keskes'
      ],
    ),
    Category(
      id: 'lm3icha',
      name: 'Lm3icha (Daily Life)',
      description: 'Hyatna lyawmiya f drouba',
      words: [
        'Moul L7anout', 'Moul Lkhodra', 'L9hwa', 'L7emmam', 'Lb7er', 'Souq',
        'Mall', 'Sbitar', 'Fermasyan', 'Lmdrasa', 'Jame3', 'Zaouia',
        'Moul Zari3a', 'Moul Lhri', 'Moul l7out', 'Gezzar', 'Mssla7a', 'M3llem',
        'Plombier', 'Trician', 'Sbbagh', 'Njar', 'Mokhazni', 'Boulissi',
        'Jadarmi', 'L9ayed', 'Lmkaddem', 'Kessal', 'Tiyaba', 'Neggafa',
        'Semsar', 'Moul ddar', 'Bank', 'Pposta', 'Moul zbel', 'Tbib', 'Ostad',
        'Moudir', 'Harras', 'Concierge', 'Kheddam', 'Patron', 'Choffeur',
        'Femme de menage', 'L7allaq', 'Kardian', 'Radio', 'L3ars', 'Sbou3',
        'Janaza', 'Lkhotba', 'Zwaj', 'Safar', 'N3ass', 'Khdma', 'Chômage',
        'Lkhlsa', 'Lcrédit', 'Lcash', 'Cyber', 'Moulat lmsmmen', 'Moul lferran',
        'Chari3', 'Derb', 'L3amil', 'Serbaya', 'Lbar'
      ],
    ),
    Category(
      id: 'mowasalat',
      name: 'Mowasalat (Transport)',
      description: 'Kifash kant7arko f lmdina',
      words: [
        'Honda', 'Khatafa', 'Petit Taxi', 'Grand Taxi', 'Ambulance', 'Tubiss',
        'Tramway', 'Car', 'Train', 'Caleche', 'Pikalla', 'Moteur', 'Trotinette',
        'Tmax', 'C100', '103', 'Dacia', 'Avion', 'Bateau', 'Helicopter',
        'Flouka', 'Babour', 'Kroça', 'Camion', 'Remorque', 'Tracteur',
        'Pneu', 'Volant', 'Guidon', 'Frein', 'Vitesse', 'Lmouteur', 'Retro',
        'Mraya', 'Plaque', 'Permis', 'Carte grise', 'L\'assurance', 'Lvisite',
        'Radar', 'Barrage', 'Autoroute', 'Route nationale', 'Péage',
        'Rond-point', 'Feu rouge', 'Stop', 'Saka', 'Station', 'Lissans',
        'Mazot', 'Garage', 'Lavage', 'Mecanicien', 'Toleur', 'Parking',
        'Fourriere', 'Ksida', 'Sabo', 'Taxi kbir', 'Autocar', 'ONCF', 'CTM',
        'Gare', 'Mahatta', 'Aeroport', 'Marssa', 'Tkit', 'Chauffeur', 'Passager',
        'Lmdina', 'L\'aroubia', 'Tomobil', 'Koutchi', 'Dépannage', 'Al Boraq', 'Bidaoui'
      ],
    ),
    Category(
      id: 'tachnniyt',
      name: 'Lkoura (Football)',
      description: 'Dawri lbotola w champions',
      words: [
        'Raja', 'Wydad', 'Far', 'Mas', 'Real Madrid', 'Barcelona', 'Lmountakhab',
        'Lbotola', 'Tiran', 'L9hwa', 'Messi', 'Ronaldo', 'Ziyech', 'Hakimi',
        'Bounou', 'Regragui', 'Guardiola', 'Arsenal', 'Chelsea', 'Manchester United',
        'Manchester City', 'Liverpool', 'Bayern Munich', 'Juventus', 'AC Milan',
        'PSG', 'Marseille', 'Derby', 'Classico', 'Champions League', 'Coupe du monde',
        'Botola Pro', 'Koura', 'Chbka', 'Gool', 'Poteau', 'Touche', 'Corner',
        'Penalty', 'Coup franc', 'Arbitre', 'Linij', 'Carton jaune', 'Carton rouge',
        'VAR', 'Hors-jeu', 'Moudarrib', 'Joueur', 'Capitaine', 'Gardien',
        'Défenseur', 'Attaquant', 'Botyos', 'Krampo', 'Tricot', 'Short', 'Match',
        'Prolongation', 'Tir au but', 'Kass l3arch', 'CAF', 'FIFA', 'Ultras',
        'Jamahir', 'Tifo', 'Flamme', 'Fumigène', 'Curva Sud', 'Curva Nord',
        'Magana', 'Frimija', 'Rba7', 'Khssara', 'Ta3adoul', 'Koura dl zan9a',
        'Mini-foot', 'Espadrille', 'Koura d lplastik', 'Tiki taka', 'Championnat'
      ],
    ),
    Category(
      id: 'blayssat',
      name: 'Blayssat (Places)',
      description: 'Mdoun w blayess f Lmeghrib',
      words: [
        'Casa', 'Rabat', 'Marrakech', 'Agadir', 'Tanger', 'Tetouan', 'Fes',
        'Meknes', 'Lmdina L9dima', 'Gueliz', 'Jamaa Lfna', 'Hassan 2', 'Ifrane',
        'Oujda', 'Berkane', 'Nador', 'Al Hoceima', 'Kenitra', 'Salé', 'Safi',
        'El Jadida', 'Essaouira', 'Tiznit', 'Taroudant', 'Ouarzazate', 'Zagora',
        'Merzouga', 'Dakhla', 'Laayoune', 'Chefchaouen', 'Asilah', 'Azrou',
        'Khouribga', 'Settat', 'Beni Mellal', 'Khenifra', 'Mohammedia', 'Bouznika',
        'Skhirat', 'Temara', 'Bab Marrakech', 'Bab Doukkala', 'Chellah', 'Oudayas',
        'Ain Diab', 'Maarif', 'Derb Sultan', 'Sidi Moumen', 'L\'Océan', 'Hay Riad',
        'Hivernage', 'Palmeraie', 'Sidi Bouzid', 'Oualidia', 'Marina', 'Corniche',
        'Mall', 'Kissariya', 'Joutiya', 'Marjane', 'Carrefour', 'Bim',
        'Lmdina l3ti9a', 'Zan9a', 'Chari3', 'Derb', '7ouma', 'Drouba', 'Balcon',
        'Sta7', 'Charjem', 'Bab', 'Lghaba', 'Jbel', 'Lwad', 'Lb7er',
        'Sidi Belyout', 'Moulay Idriss', 'L\'Hermitage', 'Bourgogne', 'Anfa',
        'L\'Agdal', 'Hassan', 'Yacoub El Mansour', 'Massira', 'Daoudiate'
      ],
    ),
    Category(
      id: 'rwina',
      name: 'Rwina wl Blbala',
      description: 'Tkhelit m3a ga3 lkategori',
      words: [], // Handled dynamically in game_provider
    )
  ];
}