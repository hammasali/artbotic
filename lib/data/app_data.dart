import '../utils/app_const.dart';

class AppDataSet {
  static const String negativePrompt =
      "(((nudity))),(((nsfw))),(((nude))),(((upskirt))),(((bra))),(((nude))),(((latex))),(((boobs))),(((panty))),(((ass))),painting, extra fingers, mutated hands, poorly drawn hands, poorly drawn face, deformed, ugly, blurry, bad anatomy, bad proportions, extra limbs, cloned face, skinny, glitchy, double torso, extra arms, extra hands, mangled fingers, missing lips, ugly face, distorted face, extra legs, anime, dual, multiple, ";

  static const List<String> arrayOfInspirations = [
    "Fantasy forest background, fantasy, digital art, christmas, dreamy forest, winter, snow, ice, christmas decoration, christmas trees",
    "An amazing alien landscape with lush vegetation and colorful galaxy foreground, digital art, breathtaking, golden ratio, extremely detailed, hyper-detailed, establishing shot, hyperrealistic, cinematic lighting, particles, unreal engine, simon stalenhag, rendered by beeple, makoto shinkai, syd meade, kentaro miura, environment concept, artstation, octane render, 8k uhd image, just landscape",
    "Fantasy, digital art, christmas, dreamy forest, winter, snow, ice, christmas decoration",
    "Magical forest background, fantasy, digital art, christmas, dreamy forest, winter, snow, ice, christmas decoration",
    "A old grizzled battleworn male dungeons and dragons dwarf warrior dressed in armor, fine art photograph, closeup studio portrait, masterpiece, golden ratio composition, beautiful, fine detail, excellent, exquisite, unique, outstanding, perfect symmetric eyes, symmetric features, wonderful, dwarf fortress courtyard in the background, evening",
    "Men, best and suits, black hair mash, blue mesh, standing picture, human",
    "The sun setting behind the mountains, birds are on the sky, hyperrealistic, full body, detailed clothing, highly detailed, cinematic lighting, stunningly beautiful, intricate, sharp focus, f/1.8, 85mm, (centered image composition), (professionally color graded), ((bright soft diffused light)), volumetric fog, trending on Instagram, trending on Tumblr, HDR 4K, 8K",
    "Kanye West, the boundary-breaking genius, shines through with his powerful music, daring lyrics, and captivating performances, hyper-realistic",
    "Iron man fire mage holding wooden fire staff, Cyberpunk hyperrealistic, full body, detailed clothing, highly detailed, cinematic lighting, stunningly beautiful, intricate, sharp focus",
    "A selection of diverse websites offering comprehensive and reliable articles in various fields: Wikipedia, Britannica, Mental Floss, National Geographic, Science Daily, Scientific American, Bright Side, and Quartz., John Singer Sargent, hyper-realistic, Anime",
    "A woman with a rose in her hair, beautiful fantasy art portrait, beautiful fantasy portrait, style of charlie bowater, charlie bowater art style, charlie bowater rich deep colors, fantasy portrait art, very beautiful fantasy art, charlie bowater character art, fantasy art portrait, charlie bowater and artgerm, by Charlie Bowater, epic fantasy art portrait",
    "Bringing colors and smiles, a true friend forever",
    "Lady gaga in iron man armor total body realistic high details, heels, hyperrealistic, full body, detailed clothing, highly detailed, cinematic lighting, stunningly beautiful, intricate, sharp focus, f/1.8, 85mm, (centered image composition), (professionally color graded), ((bright soft diffused light)), volumetric fog, trending on Instagram, trending on Tumblr, HDR 4K, 8K",
    "Furry anthro anime style cheetah, highly detailed, cinematic lighting, stunningly beautiful, intricate, sharp focus, f1.8, 85mm, (centered image composition), (professionally color graded), ((bright soft diffused light)), volumetric fog, trending on Instagram, trending on Tumblr, HDR 4K, 8K",
    "Mountain house, highly detailed, cinematic lighting, stunningly beautiful, intricate, sharp focus, f1.8, 85mm, (centered image composition), (professionally color graded), ((bright soft diffused light)), volumetric fog, trending on Instagram, trending on Tumblr, HDR 4K, 8K",
    "Red house hyperrealistic, full body, detailed clothing, highly detailed, cinematic lighting, stunningly beautiful, intricate, sharp focus, f/1.8, 85mm, (centered image composition), (professionally color graded), ((bright soft diffused light)), volumetric fog, trending on Instagram, trending on Tumblr, HDR 4K, 8K",
    "Rolling hills, rustic barns, and quiet fields hyperrealistic, full body, detailed clothing, highly detailed, cinematic lighting, stunningly beautiful, intricate, sharp focus, f/1.8, 85mm, (centered image composition), (professionally color graded), ((bright soft diffused light)), volumetric fog, trending on Instagram, trending on Tumblr, HDR 4K, 8K",
    "Red house hyperrealistic, full body, detailed clothing, highly detailed, cinematic lighting, stunningly beautiful, intricate, sharp focus, f/1.8, 85mm, (centered image composition), (professionally color graded), ((bright soft diffused light)), volumetric fog, trending on Instagram, trending on Tumblr, HDR 4K, 8K",
    "Rolling hills, rustic barns, and quiet fields hyperrealistic, full body, detailed clothing, highly detailed, cinematic lighting, stunningly beautiful, intricate, sharp focus, f/1.8, 85mm, (centered image composition), (professionally color graded), ((bright soft diffused light)), volumetric fog, trending on Instagram, trending on Tumblr, HDR 4K, 8K",
    "Red house hyperrealistic, full body, detailed clothing, highly detailed, cinematic lighting, stunningly beautiful, intricate, sharp focus, f/1.8, 85mm, (centered image composition), (professionally color graded), ((bright soft diffused light)), volumetric fog, trending on Instagram, trending on Tumblr, HDR 4K, 8K"
  ];
  static const List<String> images = [
    AppConsts.trendy,
    AppConsts.artisan,
    AppConsts.featuredTagImg,
    AppConsts.genres,
    AppConsts.shades,
    AppConsts.vibe
  ];

  static const Map<String, String> options = {
    AppConsts.oneToOne: '1 : 1',
    AppConsts.nineToSix: '9 : 16',
    AppConsts.fourToFive: '4 : 5',
    AppConsts.fourToThree: '4 : 3',
    AppConsts.fiveToThree: '5 : 3',
  };

  static const Map<String, List<String>> tagKeywords = {
    'Trendy': [
      'Current fashion trends',
      'Hip and stylish',
      'Modern chic appeal',
      'Up to the minute style',
      'Latest trendsetting',
      'Fashionably edgy vibe',
      'Contemporary coolness',
      'On point elegance',
      'Cutting edge flair',
      'Urban trend culture',
      'Hipster inspired',
      'Fresh and popular',
      'Sleek modern trends',
      'Vogue and happening',
      'Fashion forward',
      'In vogue designs',
      'Pop culture influence',
      'Highly sought after styles',
      'Streetwise chicness',
      'Cutting edge fashion',
      'Ahead of the curve elegance',
      'Fashionably innovative choices',
      'Social media trends',
      'Influencer endorsed styles',
      'Trend aware aesthetics',
      'Fashion conscious',
      'Style setting influence',
      'Ultra modern elegance',
      'Iconic trend statements',
      'Culturally relevant looks',
      'Runway inspired chic',
      'Youthful and modern',
      'High fashion aesthetics',
      'Trend conscious choices',
      'Style savvy elegance',
      'Contemporary fashion culture',
      'Edgy and fashion forward',
      'Trend inspired elegance',
      'Pop culture fueled style',
      'Progressive trend appeal',
      'Urban chic vibes',
      'Popularity driven',
      'Edgy and up to date',
      'Cutting edge style',
      'Vogue and trendy',
      'Influencer approved looks',
      'Modern trend culture',
      'Stylishly contemporary choices',
      'Fashionably hip',
      'In demand aesthetics'
    ],
    'Artisan': [
      'Skilled craftsman',
      'Artisanal craftsmanship',
      'Masterful creator',
      'Talented artisan',
      'Craftsperson\'s expertise',
      'Creative artistry',
      'Skillful handmade work',
      'Artisan\'s intricate skill',
      'Expert craftsmanship',
      'Fine artisanship',
      'Craftsperson\'s dedication',
      'Handcrafted mastery',
      'Artisanal excellence',
      'Skilled artisan\'s touch',
      'Master craftsman\'s work',
      'Handmade precision',
      'Craftsmanship',
      'Artisan\'s creative flair',
      'Skilled handwork',
      'Meticulous',
      'Artisanal skillfulness',
      'Craftsperson\'s',
      'Expert artisan touch',
      'Creative craftsmanship',
      'Fine artisan work',
      'Skilled creator\'s touch',
      'Artisan\'s attention to detail',
      'Masterful handwork',
      'Craftsperson\'s artistry',
      'Artisanal finesse',
      'Skilled craftsperson\'s touch',
      'Artisan\'s meticulous work',
      'Expert handiwork',
      'Creative artisan\'s touch',
      'Masterful artistry',
      'Craftsmanship finesse',
      'Artisanal dedication',
      'Skilled craftsmanship',
      'Craftsperson\'s ingenuity',
      'Artisan\'s intricate craftsmanship',
      'Skilled creator\'s dedication',
      'Expert artisanal touch',
      'Craftsperson\'s',
      'Artisan\'s attention to craftsmanship',
      'Masterful handmade work',
      'Skilled artisanship',
      'Craftsperson\'s creative touch',
      'Artisanal mastery',
      'Expert artisan craftsmanship',
      'Creative craftsperson\'s work'
    ],
    'Featured': [
      'Prominently featured content',
      'Highlighted and showcased',
      'Featured artist spotlight',
      'Special featured section',
      'Prominently displayed content',
      'Exclusive featured selection',
      'Showcased and highlighted',
      'Prime featured spot',
      'Notable featured items',
      'Premier featured content',
      'Top featured articles',
      'Showcasing featured artists',
      'Spotlit and highlighted',
      'Spotlight on featured',
      'Prominent featured position',
      'Selected featured works',
      'Noteworthy featured pieces',
      'Presented in featured',
      'Standout featured items',
      'Highlighted content section',
      'Main featured attraction',
      'Displayed as featured',
      'Spotlighted and showcased',
      'Premier showcased content',
      'Centerstage featured items',
      'Prime featured content',
      'Exclusive featured showcase',
      'Prominently highlighted work',
      'Featured artist spotlight',
      'Top featured selection',
      'Notable showcase feature',
      'Highlighted featured items',
      'Special showcased content',
      'Displayed in featured',
      'Premier showcase feature',
      'Prominent featured artist',
      'Highlighted featured work',
      'Exclusive spotlighted content',
      'Prime showcase selection',
      'Prominently displayed items',
      'Noteworthy showcase items',
      'Premier featured items',
      'Spotlight on featured',
      'Selected spotlighted work',
      'Featured artist gallery',
      'Displayed as showcased',
      'Prime spotlight position',
      'Prominent spotlight feature',
      'Showcased artist spotlight',
      'Premier highlight section'
    ],
    'Genres': [
      'Music genre classification',
      'Film genre categories',
      'Artistic genre variations',
      'Creative genre exploration',
      'Genre blending innovation',
      'Hybrid genre experiments',
      'Genre defying creations',
      'Cross genre collaboration',
      'Innovative genre twists',
      'Unique genre interpretations',
      'Genre bending creativity',
      'Genre',
      'Genre spanning diversity',
      'Contemporary genre fusions',
      'Experimental genre shifts',
      'Genre diverse offerings',
      'Multifaceted genre expressions',
      'Cross genre influences',
      'Genre crossover innovation',
      'Traditional genre styles',
      'Dynamic genre adaptations',
      'Genre melding',
      'Genre evolution trends',
      'Niche genre interpretations',
      'Hybrid genre experimentation'
    ],
    'Shades': [
      'Different color shades',
      'Various tonal variations',
      'Gradient of colors',
      'Diverse shade spectrum',
      'Broad color palette',
      'Array of hues',
      'Shifting color tones',
      'Multitude of shades',
      'Tonal gradient range',
      'Palette of colors',
      'Extensive shade options',
      'Wide ranging color variations',
      'Myriad of hues',
      'Rich color spectrum',
      'Varying tonal depths',
      'Abundance of shades',
      'Multicolor shading',
      'Broad tonal spectrum',
      'Assortment of colors',
      'Multiple shade gradients',
      'Myriad tonal nuances',
      'Range of tints',
      'Multifaceted color palette',
      'Broad shade spectrum',
      'Varied color tints',
      'Extensive tonal options',
      'Palette of hues',
      'Comprehensive shade range',
      'Myriad color choices',
      'Rich tonal variations',
      'Assorted color shades',
      'Varying hue depths',
      'Diverse shading options',
      'Multicolor tonal spectrum',
      'Myriad shade possibilities',
      'Broad range of tints',
      'Extensive hue selection',
      'Versatile tonal palette',
      'Assortment of hues',
      'Multifaceted shading',
      'Comprehensive tonal spectrum',
      'Myriad color gradients',
      'Varied shade depths',
      'Palette of tints',
      'Broad color variety',
      'Varying tonal choices',
      'Rich hue spectrum',
      'Assorted shade gradients',
      'Multicolor tonal range',
      'Myriad hue options',
    ],
    'Vibe': [
      'Positive energy vibe',
      'Chill and relaxed vibe',
      'Energetic atmosphere vibe',
      'Cool and inviting vibe',
      'Calm and soothing vibe',
      'Laid back mood vibe',
      'Creative vibes flow',
      'Upbeat ambiance vibe',
      'Vibrant and lively vibe',
      'Mellow and pleasant vibe',
      'Funky groove feeling',
      'Serene and peaceful vibe',
      'Joyful energy buzz',
      'Eclectic mood mix',
      'Urban chic vibe',
      'Wholesome and friendly vibe',
      'Enigmatic aura vibe',
      'Radiant spirit glow',
      'Modern and trendy vibe',
      'Hip and casual vibe',
      'Dreamy atmospheric sensation',
      'Harmonious tone setting',
      'Electric energy charge',
      'Nostalgic and warm vibe',
      'Exotic cultural vibes',
      'Bohemian free spiritedness',
      'Coastal vacation vibe',
      'Mystical and alluring vibe',
      'Playful and carefree vibe',
      'Majestic natural vibe',
      'Romantic candlelit mood',
      'Intimate jazz vibes',
      'Indie alternative vibe',
      'Funk and soulful vibe',
      'Contemporary chic feel',
      'Artistic and expressive vibe',
      'Enchanted forest vibe',
      'Cosmopolitan city vibe',
      'Beachy and breezy vibe',
      'Whimsical fairy tale mood',
      'Rustic countryside vibe',
      'Futuristic tech vibes',
      'Vintage retro vibe',
      'Carnival fun atmosphere',
      'Soothing spa tranquility',
      'Neon nightlife vibes',
      'Rainy day coziness',
      'Midnight starry aura',
      'Cultural fusion vibe',
      'Boho festival vibe'
    ]
  };

  static const List<Map<String, dynamic>> styleModels = [
    {'model_id': 'sdxl', 'model_name': 'SDXL', 'drawable': AppConsts.e},
    {
      'model_id': 'f222-diffusion',
      'model_name': 'F222',
      'drawable': AppConsts.b
    },
    {
      'model_id': 'night-diffusion',
      'model_name': 'Night Diffusion',
      'drawable': AppConsts.c
    },
    {
      'model_id': 'woolitize-diffusion',
      'model_name': 'Woolitize',
      'drawable': AppConsts.d
    },
    {
      'model_id': 'midjourney-v4',
      'model_name': 'MidJourney-V4',
      'drawable': AppConsts.f
    },
    {
      'model_id': 'anything-v5',
      'model_name': 'Anything V5',
      'drawable': AppConsts.g
    },
    {
      'model_id': 'stable-diffu',
      'model_name': 'Stable Diffusion 2.0',
      'drawable': AppConsts.g
    },
    {'model_id': 'inkmix', 'model_name': 'Ink Mix', 'drawable': AppConsts.h},
    {
      'model_id': 'analog-diffusion',
      'model_name': 'Analog Diffusion',
      'drawable': AppConsts.i
    },
    {'model_id': 'hasdx', 'model_name': 'HASDX', 'drawable': AppConsts.j},
    {
      'model_id': 'realistic-vision-v20-2047',
      'model_name': 'Realistic Vision V2.0',
      'drawable': AppConsts.k
    },
    {
      'model_id': 'wavy-diffusion',
      'model_name': 'Movies character diffusion',
      'drawable': AppConsts.d
    },
  ];

  static const List<Map<String, String>> inspirations = [
    {
      'icon': AppConsts.iOne,
      'prompt':
          "full length oil painting of gorgeous woman as a translucent [artic fox spirit]| (full body)| detailed face| wearing white dress| straight white hair| mythical| elegant| hyperrealism| highly detailed| intricate detailed| volumetric lighting| Ukiyo-E| by Anne Stokes and Noriyoshi Ohrai"
    },
    {
      'icon': AppConsts.iTwo,
      'prompt':
          "Tiny cute duck playing guitar toy, standing character, soft smooth lighting, soft pastel colors, skottie young,3d blender render, polycount, modular constructivism, pop surrealism, physically based rendering, square image"
    },
    {
      'icon': AppConsts.iThree,
      'prompt':
          "an animated digital art illustration of a woman's eye and makeup, in the style of tristan eaton, psychedelic artwork, cyril rolando, orange and azure, conceptual art pieces, psychedelic tableaux, multi-layered figures"
    },
    {
      'icon': AppConsts.iFour,
      'prompt':
          "Splash art of an armored mage channeling arcane magicks, mana shooting from his hands, mystical energy in the air, action shot, heroic fantasy art,special effects, hd octane render"
    },
    {
      'icon': AppConsts.iFive,
      'prompt':
          "Full head and shoulders, beautiful female porcelain sculpture by daniel arsham and james jean, smooth, all white features on a white background, delicate facial features, white eyes, white lashes, detailed tangled white lillies and lillie leaves on the head,volumetric lighting"
    },
    {
      'icon': AppConsts.iSix,
      'prompt':
          "Very detailed female, steampunk city taken over by plants in the background, d & d, fantasy, with blue flowers, beautiful face, hyperrealism delicate detailed complex, sophisticated, vibrant colors, volumetric lighting, pop surrealism art by Mark Ryden and Anna Dittmann"
    },
    {
      'icon': AppConsts.iSeven,
      'prompt':
          "Tiny cute cow toy, reading a book, standing character, soft smooth lighting, soft pastel colors, skottie young, 3d blender render, polycount, modular constructivism, pop surrealism, physically based rendering, square image"
    },
    {
      'icon': AppConsts.iEight,
      'prompt': "Photo in a Post-Apocalyptic town, with houses and cars"
    },
    {
      'icon': AppConsts.iNine,
      'prompt':
          "tiny cute isometric kitchen in a cutaway box, soft smooth lighting, soft colours, 100mm lens, 3d blender render"
    },
    {
      'icon': AppConsts.iTen,
      'prompt':
          "Hypnotic illustration of a deer face, hypnotic psychedelic art by Dan Mumford, pop surrealism, dark glow neon paint, mystical, Behance"
    },
    {
      'icon': AppConsts.iEleven,
      'prompt':
          "Digital art of an orc with metal armor, by Larry Elmore, by Justin Gerard"
    },
    {
      'icon': AppConsts.iTwelve,
      'prompt':
          "A peaceful Japanese city street, dreamy, soft + colors, studio ghibli style"
    },
    {
      'icon': AppConsts.iThirteen,
      'prompt':
          "An elegant winged fairy in the lord of the rings scenery landscape, looking out at a vast lush valley flowers and homes made of mushrooms, stream, sunrise, god's rays highly detailed, vivid color, cinematic lighting, perfect composition, 8 k, gustave dore, derek zabrocki, greg rutkowski, belsinski, octane render."
    },
    {
      'icon': AppConsts.iFourteen,
      'prompt':
          "concept: The Battle of the Gods and Demons in Heaven\n\nIn Hindu mythology, there is often a struggle between gods (devas) and demons (asuras) for control over heaven and earth. You can create an image that depicts a fierce and chaotic battle taking place in the heavenly realms.\n\nScene Description:\n\nSetting: The image should be set in a celestial and surreal landscape, with floating islands, radiant clouds, and divine architecture to represent heaven.\n\nGods and Demons: Depict various gods from Hindu mythology, such as Lord Vishnu, Lord Shiva, Lord Indra, and others, on one side. On the other side, show formidable demon kings like Ravana, Mahishasura, and others.\n\nWeapons and Powers: Illustrate the gods and demons using their iconic weapons"
    },
    {
      'icon': AppConsts.iFifteen,
      'prompt': "painting of a car parked in front of a shop"
    },
    {
      'icon': AppConsts.iSixteen,
      'prompt':
          "An ultra hd detailed watercolor painting, Jean-Baptiste Monge style,masterpiece, 32k, extremely high detailed, An anthropomorphic African wild dog, crouching, in the bush, fluffy, detailed hair, wearing battle clothes of Maasai people, savannah, bright colors, Maasai jewelry, holding a Maasai spear, digital painting, high quality, realistic, luminism, perfect, cinematic lighting, vivid colors, dark colors"
    },
  ];
}
