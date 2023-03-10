require "open-uri"

puts "adding users"
Mascot.destroy_all
User.destroy_all
chieri = User.create!(nickname: "chierikii", email: "kiichieri@gmail.com", password: "123123")
gilary = User.create(nickname: "gillaryb", email: "gilarybacnis@gmail.com", password: "123123")
anri = User.create(nickname: "Anri009", email: "anto199309@gmail.com", password: "123123")
jim = User.create(nickname: "MosDeef", email: "james.deeth@gmail.com", password: "123123")

puts "making Mascots"

mascots_data = [{
  name: "Matsudo-san",
  description: "The bouncy businessman mascot of Matsudo City. The kanji for Matsudo (松戸) is on his face.",
  location: "Matsudo City",
  price: 5000,
  user: jim,
  photo_url: "https://res.cloudinary.com/dumhjhc95/image/upload/v1676875633/Screenshot_2023-02-20_at_3.34.19_pm_vvogdx.png"
},
{
  name: "Lerch-san",
  description: "The towering Lerch-san, mascot for Niigata Prefecture, is based on Theodor Von Lerch, an Austro-Hungarian who introduced skiing to Japan in 1911. He reaches the ceiling here, at the Tobu Department Store in Ikebukuro.",
  location: "Niigata",
  price: 5000,
  user: jim,
  photo_url: "https://res.cloudinary.com/dumhjhc95/image/upload/v1676876339/Screenshot_2023-02-20_at_3.58.47_pm_vdzmor.png"
},
{
  name: "Fuwarito",
  description: "Fuwarito,
  the mascot for Fuwari randoseru (school backpacks for kids),
  is dressed up for the holidays.",
  location: "Ikebukuro",
  price: 10000,
  user: anri,
  photo_url: "https://res.cloudinary.com/dumhjhc95/image/upload/v1676876596/Fuwarito_lkzyq8.png"
},
{
  name: "Kyun-chan",
  description: "Kyun-chan,
  a shy Japanese pika disguised as a deer,
  is the tourism mascot for Hokkaido.",
  location: "Hokkaido",
  price: 5000,
  user: jim,
  photo_url: "https://res.cloudinary.com/dumhjhc95/image/upload/v1676876844/Kyun-chan_jzlpqj.png"
},
{
  name: "Konyudo-kun",
  description: "Konyudo-kun at the end of the World Character Summit in Hanyu. Konyudo-kun is the mascot of Yokkaichi City and is based on a giant, 200-year-old mechanical doll that appears at festivals there",
  location: "Yokkaichi City",
  price: 5000,
  user: chieri,
  photo_url: "https://res.cloudinary.com/dumhjhc95/image/upload/v1676877016/Konyudo-kun_jc53xg.png"
},
{
  name: "Kumamon",
  description: "Kumamon (くまモン) was created in 2010 for a campaign created to draw tourists to the region after the Kyushu Shinkansen line opened. Kumamon subsequently became nationally popular, and in late 2011, was voted top in a nationwide survey of mascots.",
  location: "Kumamoto",
  price: 50000,
  user: chieri,
  photo_url: "https://res.cloudinary.com/dumhjhc95/image/upload/v1677220374/c8d69abc5c32b0f79080671caec08ff4--kumamoto-eggplants_n83hep.jpg"
},
{
  name: "Sanudon",
  description: "Sanudon the udon noodle fairy, whose eyebrows are based on a mountain, promotes Sanuki udon",
  location: "Kagawa",
  price: 5000,
  user: gilary,
  photo_url: "https://res.cloudinary.com/dumhjhc95/image/upload/v1676881295/Sanudon_ix77uo.png"
},
{
  name: "Gen-chan",
  description: "Gen-chan is a river otter who plays the saxophone.",
  location: "Ehime",
  price: 5000,
  user: gilary,
  photo_url: "https://res.cloudinary.com/dumhjhc95/image/upload/v1676881443/genchan_xgyf7x.png"
},
{
  name: "Marimokkori",
  description: "Inspired by algal blooms, Marimokkori is a giant algae ball that...bulges...",
  location: "Hokkaido",
  price: 5000,
  user: User.all.sample,
  photo_url: "https://res.cloudinary.com/dumhjhc95/image/upload/v1676881676/hokkaido-mascot1_hd11we.jpg"
},

{
  name: "Ninja Jinja",
  description: "The ninja Jinenja of the kingdom (commonly known as Neba-land), which is said to be located in the depths of Shiroi City, Chiba Prefecture, is given the product of his hometown, and goes to rescue Princess Tororo, who was kidnapped by someone. started special training.",
  location: "Shiroi City, Chiba Prefecture",
  price: 5000,
  user: anri,
  photo_url: "https://res.cloudinary.com/dumhjhc95/image/upload/v1676882266/00002621_fp7nbe.jpg"
},
{
  name: "Mr. Sike Delhi",
  description: "The official character of Koenji, a town with many spice curry restaurants, known as Japan's India, where a wide variety of cultures coexist. She wears Awa Odori tabi. A deli that injects happiness with licking happy power",
  location: "Koenji",
  price: 5000,
  user: anri,
  photo_url: "https://res.cloudinary.com/dumhjhc95/image/upload/v1676882609/00002585_hbni0f.jpg"
  },
{
  name: "Tureppon",
  description: "Tureppon, the mascot of Upopoy National Ainu Museum and Park in Hokkaido, is a bulb of turep, a plant from which the Ainu people extract starch to use in medicines and cooking.",
  location: "Upopoy, Hokkaido",
  price: 5000,
  user: jim,
  photo_url: "https://res.cloudinary.com/dumhjhc95/image/upload/v1676967602/TureppoN_tg1b8c.png"
},
{
  name: "Sobacchi",
  description: "Sobacchi, has a bowl of soba noodles for a head, is a mascot from  Prefecture.",
  location: "Iwate",
  price: 5000,
  user: gilary,
  photo_url: "https://res.cloudinary.com/dumhjhc95/image/upload/v1676967875/Screenshot_2023-02-21_at_5.23.43_pm_paa8at.png"
},
{
  name: "Direct-kun",
  description: "Direct-kun is a box of Ryukakusan Direct throat medicine wearing a top hat and bow tie.",
  location: "Tokyo",
  price: 5000,
  user: chieri,
  photo_url: "https://res.cloudinary.com/dumhjhc95/image/upload/v1676968228/Direct-kun_oedazk.png"
},
{
  name: "Sanomaru",
  description: "Sanomaru, the official mascot of Sano City, Tochigi Prefecture, was named the softest of them all and snuggled the top spot in the Yuru Kyara Grandprix 2013. Sanomaru beat more than 1,500 equally cuddly characters which represented other municipalities and corporations. ",
  location: "Tochigi",
  price: 1000000,
  user: gilary,
  photo_url: "https://res.cloudinary.com/dumhjhc95/image/upload/v1676968353/sanomaru_w4soza.jpg"
},
{
  name: "Sakurakki",
  description: "This is Sakurakki-, the RP character for tourism in the town of Ogawara, Miyagi Prefecture! His head is the town flower “Sakura”, his face is the town bird “Swan”, and his body is the town tree “Ume”! He’s a fairy who makes lucky flowers bloom!
  My hobbies are walking, exploring and eating!  Nice to meet you all!",
  location: "Ogawara, Miyagi",
  price: 5000,
  user: anri,
  photo_url: "https://res.cloudinary.com/dumhjhc95/image/upload/v1676968637/sakulucky_o9jzkk.png"
},
{
  name: "Go-chan",
  description: "Go-chan is the “longevity ambassador” for Okinawa Island, and scares people into being healthy. It works—Okinawans live the longest in the world.",
  location: "Okinawa",
  price: 15000,
  user: anri,
  photo_url: "https://res.cloudinary.com/dumhjhc95/image/upload/v1676968896/DlvFsfgU4AEUlcL_sxgrwx.jpg"
},
{
  name: "Unberto",
  description: "This philosophical poop is the  mascot for the Tokyo Unko Museum.",
  location: "Tokyo",
  price: 5000,
  user: jim,
  photo_url: "https://res.cloudinary.com/dumhjhc95/image/upload/v1676969072/Unberto_mfmdhi.jpg"
},
{
  name: "Sento-Kun",
  description: "The city of Nara has a long tradition of adopting guardian deities such as Nio (a pair of temple guardians), Asura, Jūni Shinshō (Twelve Heavenly Generals) and Shitenno (Four Guardian Kings). The new mascot was chosen by the city office to inherit their mission, and as a personification of the ancient capital dotted with temples, gardens and shrines. Sento-kun resembles an amiable young boy who has the antlers of a deer, an animal which has long been regarded as a heavenly protector of the city",
  location: "Nara, Japan",
  price: 15000,
  user: anri,
  photo_url: "https://res.cloudinary.com/dumhjhc95/image/upload/v1677220773/sento_gax5hp.jpg"
},
{
  name: "Nebaaru-Kun",
  description: "Nebaaru-kun is the unofficial mascot of natto, the Japanese fermented soybean dish that divides non-Japanese diners: you either love it or hate it. ",
  location: "Ibaraki",
  price: 15000,
  user: gilary,
  photo_url: "https://res.cloudinary.com/dumhjhc95/image/upload/v1677221033/nebaru_yu8kva.jpg"
},
{
  name: "Funeko",
  description: "A cute cat guardian deity of the Hankyu Ferry, which connects Kyushu and Kansai.
  She has a laid back personality and goes at her own pace. Their hobby is hide and seek. Her favorite foods are fish and takoyaki!",
  location: "Osaka",
  price: 25000,
  user: chieri,
  photo_url: "https://res.cloudinary.com/dumhjhc95/image/upload/v1677221160/00003792_amtfbq.jpg"
},
{
  name: "Unagiimo Unamo",
  description: "Hamamatsu new specialty! Sweet potatoes grown by using the part of the eel that would otherwise be thrown away as fertilizer. Eel potatoes are full of honey! Characterized by its thick texture. The eel that was born in the eel field is still being promoted today.",
  location: "Hamamatsu",
  price: 5000,
  user: chieri,
  photo_url: "https://res.cloudinary.com/dumhjhc95/image/upload/v1677221415/00002670_jdovxe.jpg"
}
]
mascots_data.each do |mascothash|
  mascot = Mascot.find_or_create_by!(mascothash.except(:photo_url))
  unless mascot.photo.attached?
    file = URI.open(mascothash[:photo_url])
    mascot.photo.attach(io: file, filename: "#{mascot.name}.png", content_type: "image/png")
    mascot.save
  end

  puts "adding reviews"
  User.where.not(id: mascot.user).each do |user|
    review = Review.new(comment: "Cute and friendly Mascot!", rating: rand(0..5))
    review.user = user
    review.mascot = mascot
    review.save!
  end
end

puts "done"
