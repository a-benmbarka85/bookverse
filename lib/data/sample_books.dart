import 'package:bookverse/models/book.dart';

const List<Book> sampleBooks = <Book>[
  Book(
    id: 'harry-potter-philosophers-stone',
    title: 'Harry Potter i la pedra filosofal',
    imageUrl: 'https://covers.openlibrary.org/b/isbn/9780747532699-L.jpg',
    category: 'Fantasia',
    pages: 223,
    chapters: 17,
    chapterTitles: <String>[
      'Capítol 1: El nen que va sobreviure',
      'Capítol 2: El vidre que va desaparèixer',
      'Capítol 3: Les cartes d\'en cap persona',
      'Capítol 4: El guardià de les claus',
    ],
    summary: <String>[
      'Harry descobreix que és un mag i entra a Hogwarts.',
      'Coneix en Ron i l\'Hermione i s\'enfronta a les forces del mal.',
    ],
  ),
  Book(
    id: 'the-hobbit',
    title: 'El hòbbit',
    imageUrl: 'https://covers.openlibrary.org/b/isbn/9780547928227-L.jpg',
    category: 'Aventura',
    pages: 310,
    chapters: 19,
    chapterTitles: <String>[
      'Capítol 1: Un banquet inesperat',
      'Capítol 2: Ovelles i dracs',
      'Capítol 3: Un curt viatge',
    ],
    summary: <String>[
      'En Bilbo Saquet és arrossegat a una aventura amb nans.',
      'Recupera el tresor custodiat pel drac Smaug.',
    ],
  ),
  Book(
    id: '1984',
    title: '1984',
    imageUrl: 'https://covers.openlibrary.org/b/isbn/9780451524935-L.jpg',
    category: 'Ciència-ficció',
    pages: 328,
    chapters: 24,
    chapterTitles: <String>[
      'Part 1: El món de Big Brother',
      'Part 2: El diari i l\'amor',
      'Part 3: El Ministeri de l\'Amor',
    ],
    summary: <String>[
      'Winston Smith viu en un règim totalitari.',
      'Intenta rebel·lar-se i és capturat i reeducat.',
    ],
  ),
  Book(
    id: 'don-quixote',
    title: 'El Quixot',
    imageUrl: 'https://covers.openlibrary.org/b/isbn/9780060934347-L.jpg',
    category: 'Clàssic',
    pages: 1072,
    chapters: 52,
    chapterTitles: <String>[
      'Primera part: les primeres sortides',
      'Segona part: el viatge amb Sancho',
    ],
    summary: <String>[
      'Un hidalgo embogit per les novel·les de cavalleries surt a fer gestes.',
      'Les seves aventures són paròdiques i commovedores.',
    ],
  ),
  Book(
    id: 'little-prince',
    title: 'El petit príncep',
    imageUrl: 'https://covers.openlibrary.org/b/isbn/9780156012195-L.jpg',
    category: 'Infantil',
    pages: 96,
    chapters: 27,
    chapterTitles: <String>[
      'Capítol 1: La serp i el desert',
      'Capítol 2: La rosa',
      'Capítol 3: La guineu',
    ],
    summary: <String>[
      'Un pilot coneix un petit príncep d\'un altre planeta.',
      'Aprèn lliçons sobre l\'amor i la responsabilitat.',
    ],
  ),
  Book(
    id: 'pride-and-prejudice',
    title: 'Orgull i prejudici',
    imageUrl: 'https://covers.openlibrary.org/b/isbn/9780141439518-L.jpg',
    category: 'Romanç',
    pages: 432,
    chapters: 61,
    chapterTitles: <String>[
      'Capítol 1: El ball de Meryton',
      'Capítol 2: La visita a Netherfield',
    ],
    summary: <String>[
      'Elizabeth Bennet coneix el senyor Darcy.',
      'Superen malentesos i acaben junts.',
    ],
  ),
  Book(
    id: 'metamorphosis',
    title: 'La metamorfosi',
    imageUrl: 'https://covers.openlibrary.org/b/isbn/9780553213690-L.jpg',
    category: 'Clàssic',
    pages: 104,
    chapters: 3,
    chapterTitles: <String>[
      'Part 1: La transformació',
      'Part 2: La reclusió',
      'Part 3: La fi',
    ],
    summary: <String>[
      'Gregor Samsa es desperta convertit en un insecte gegant.',
      'La seva família l\'aïlla fins que mor.',
    ],
  ),
  Book(
    id: 'one-hundred-years-of-solitude',
    title: 'Cent anys de solitud',
    imageUrl: 'https://covers.openlibrary.org/b/isbn/9780060883287-L.jpg',
    category: 'Realisme màgic',
    pages: 417,
    chapters: 20,
    chapterTitles: <String>[
      'Capítol 1: La fundació de Macondo',
      'Capítol 2: Els gitanos i les descobertes',
    ],
    summary: <String>[
      'Segueix set generacions de la família Buendía.',
      'Macondo viu auge i decadència.',
    ],
  ),
  Book(
    id: 'lord-of-the-rings',
    title: 'El senyor dels anells',
    imageUrl: 'https://covers.openlibrary.org/b/isbn/9780547928210-L.jpg',
    category: 'Fantasia èpica',
    pages: 1178,
    chapters: 62,
    chapterTitles: <String>[
      'Llibre 1: La comunitat de l\'anell',
      'Llibre 2: Les dues torres',
      'Llibre 3: El retorn del rei',
    ],
    summary: <String>[
      'Frodo ha de destruir l\'Anell Únic a Mordor.',
      'La Companyia s\'enfronta a les forces de Sàuron.',
    ],
  ),
  Book(
    id: 'chronicle-announced-death',
    title: 'Crònica d\'una mort anunciada',
    imageUrl: 'https://covers.openlibrary.org/b/isbn/9781400034719-L.jpg',
    category: 'Novel·la',
    pages: 122,
    chapters: 5,
    chapterTitles: <String>[
      'Capítol 1: El dia abans de la mort',
      'Capítol 2: La reconstrucció dels fets',
    ],
    summary: <String>[
      'Tots saben que mataran Santiago Nasar, però ningú no l\'avisa.',
      'La novel·la reconstrueix les hores prèvies.',
    ],
  ),
];
