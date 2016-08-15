user = User.create(email: "macrodynamo@gmail.com", password: "2Einsteins", role: 2)

tag = Tag.create(name: "rates")

post = Post.create(title: "The Big Short", content: "Pommy ipsum brainbox off the hook numpty had a barney with the inlaws, brainbox unhand me sir pennyboy bow ties are cool complete mare, sod's law clotted cream corgi daft cow. Copper nose rag through the dales mince pies on't goggle box Elementary my dear Watson anorak bobby mush gravy cheese and chips, bit of a Jack the lad cheesed off a week on Sunday could be a bit of a git spiffing jellied eels Moriarty what a load of guff. Dignified the black death tad Essex girls corgi stew and dumps chips, completely starkers narky pigeons in Trafalgar Square wedding tackle balderdash sod's law, I could reet fancy a bit of alright a tad a bottle of plonk lass.", summary: "Pommy ipsum brainbox off the hook numpty had a barney with the inlaws, brainbox unhand me sir pennyboy bow ties are cool complete mare.", post_date: "june 20 2016", tag_id: 1)

trade = Trade.create(direction: "buy", size: 1, product: "TYZ6", trade_date: "aug 10, 2016", price: 133.25)
