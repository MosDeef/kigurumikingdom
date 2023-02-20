require "open-uri"

puts "making Mascots"

mascots_data = [{
  name: "Matsudo-san",
  description: "The bouncy businessman mascot of Matsudo City. The kanji for Matsudo (松戸) is on his face.",
  location: "Matsudo City",
  price: 5000,
  photo_url: "https://res.cloudinary.com/dumhjhc95/image/upload/v1676875633/Screenshot_2023-02-20_at_3.34.19_pm_vvogdx.png"
},
{name: "Lerch-san",
  description: "The towering Lerch-san, mascot for Niigata Prefecture, is based on Theodor Von Lerch, an Austro-Hungarian who introduced skiing to Japan in 1911. He reaches the ceiling here, at the Tobu Department Store in Ikebukuro.",
  location: "Niigata",
  price: 5000,
  photo_url: "https://res.cloudinary.com/dumhjhc95/image/upload/v1676876339/Screenshot_2023-02-20_at_3.58.47_pm_vdzmor.png"
},
{name: "Fuwarito",
  description: "Fuwarito,
  the mascot for Fuwari randoseru (school backpacks for kids),
  is dressed up for the holidays.",
  location: "Ikebukuro",
  price: 5000,
  photo_url: "https://res.cloudinary.com/dumhjhc95/image/upload/v1676876596/Fuwarito_lkzyq8.png"
},
{name: "Kyun-chan",
  description: "Kyun-chan,
  a shy Japanese pika disguised as a deer,
  is the tourism mascot for Hokkaido.",
  location: "Hokkaido",
  price: 5000,
  photo_url: "https://res.cloudinary.com/dumhjhc95/image/upload/v1676876844/Kyun-chan_jzlpqj.png"
},
{name: "Konyudo-kun",
  description: "Konyudo-kun at the end of the World Character Summit in Hanyu. Konyudo-kun is the mascot of Yokkaichi City and is based on a giant,
  200-year-old mechanical doll that appears at festivals there",
  location: "Yokkaichi City",
  price: 5000,
  photo_url: "https://res.cloudinary.com/dumhjhc95/image/upload/v1676877016/Konyudo-kun_jc53xg.png"
},
{name: "Kumamon",
  description: "Kumamon (くまモン) was created in 2010 for a campaign created to draw tourists to the region after the Kyushu Shinkansen line opened. Kumamon subsequently became nationally popular,
  and in late 2011,
  was voted top in a nationwide survey of mascots.",
  location: "Kumamoto",
  price: 500000,
  photo_url: "https://res.cloudinary.com/dumhjhc95/image/upload/v1676877109/kumon_2_cjenmo.jpg"
},
{name: "Sanudon",
  description: "Sanudon the udon noodle fairy, whose eyebrows are based on a mountain, promotes Sanuki udon",
  location: "Kagawa",
  price: 5000,
  photo_url: "https://res.cloudinary.com/dumhjhc95/image/upload/v1676881295/Sanudon_ix77uo.png"
},
{name: "Gen-chan",
  description: "Gen-chan is a river otter who plays the saxophone.",
  location: "Ehime",
  price: 5000,
  photo_url: "https://res.cloudinary.com/dumhjhc95/image/upload/v1676881443/genchan_xgyf7x.png"
},
{name: "Marimokkori",
  description: "Inspired by algal blooms, Marimokkori is a giant algae ball that...bulges...",
  location: "Hokkaido",
  price: 5000,
  photo_url: "https://res.cloudinary.com/dumhjhc95/image/upload/v1676881676/hokkaido-mascot1_hd11we.jpg"
},
{name: "White Underground Kingdom Ninja Jinja",
  description: "The ninja Jinenja of the kingdom (commonly known as Neba-land), which is said to be located in the depths of Shiroi City, Chiba Prefecture, is given the product of his hometown, and goes to rescue Princess Tororo, who was kidnapped by someone. started special training.",
  location: "Shiroi City, Chiba Prefecture",
  price: 5000,
  photo_url: "https://res.cloudinary.com/dumhjhc95/image/upload/v1676882266/00002621_fp7nbe.jpg"
},
{name: "Mr. Sike Delhi",
  description: "The official character of Koenji, a town with many spice curry restaurants, known as Japan's India, where a wide variety of cultures coexist. She wears Awa Odori tabi. A deli that injects happiness with licking happy power",
  location: "Koenji",
  price: 5000,
  photo_url: "https://res.cloudinary.com/dumhjhc95/image/upload/v1676882609/00002585_hbni0f.jpg"
  }
]

mascots_data.each do |mascothash|
  mascot = Mascot.find_or_create_by(mascothash.except(:photo_url))
  unless mascot.photo.attached?
    file = URI.open(mascothash[:photo_url])
    mascot.photo.attach(io: file, filename: "#{mascot.name}.png", content_type: "image/png")
    mascot.save
  end
end

puts "adding users"

User.create(nickname: "chierikii", email: "kiichieri@gmail.com")
User.create(nickname: "gillaryb", email: "gilarybacnis@gmail.com")
User.create(nickname: "Anri009", email: "anto199309@gmail.com")
User.create(nickname: "MosDeef", email: "james.deeth@gmail.com")

puts "done"
