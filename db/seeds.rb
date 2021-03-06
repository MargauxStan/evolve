# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Chatroom.destroy_all
User.destroy_all
UsersProgram.destroy_all
Program.destroy_all

User.create!(username: "marg", email: "marg@email.com", password: "azerty", level: 1, xp: 200, last_sign_in_at: (Date.today - 1), days_streak: 1)
User.create!(username: "momo", email: "momo@email.com", password: "azerty", level: 3, xp: 970, last_sign_in_at: (Date.today - 2), days_streak: 2)
User.create!(username: "clem", email: "clem@email.com", password: "azerty", level: 5, xp: 100, last_sign_in_at: Date.today, days_streak: 0)

#récupérer les users présents

marg = User.find_by_email("marg@email.com")
momo = User.find_by_email("momo@email.com")
clem = User.find_by_email("clem@email.com")
users = [marg, momo, clem]

#création des programs

prog1 = Program.create!(title: "Design Thinking", description: "Vous voulez résoudre des problèmes pratiques et théoriques de façon créative ? Lancez-vous dans le programme « Design Thinking ».", unlock_program: 1)
prog2 = Program.create!(title: "Protection de l'innovation" , description: "Vous avez peur que vos idées soient reprises par d'autre? Apprenez ici comment les protéger.", unlock_program: 1)
prog3 = Program.create!(title: "Réaliser un Business Plan", description: "Le Business Plan est une étape importante de la construction d'un projet d'entreprise. Construisez le pas à pas grace à ce programme.", unlock_program: 1)
prog4 = Program.create!(title: "Analyse des coûts", description: "Votre projet est-il viable financièrement? Analysez vos coûts et vos gains potentiels et adaptez votre projet à vos containtes budgétaires", unlock_program: 2)
prog5 = Program.create!(title: "Marketing Digital", description: "Aujourd'hui il est important de faire connaître votre projet grace au Marketing Digital. Ce porgramme va vous permettre d'apprendre à utiliser ces outils au service de votre communication", unlock_program: 3)
prog6 = Program.create!(title: "Faire son site avec WordPress", description: "Vous pouvez réaliser vous même un site web de manière assez simple grace à Wordpress", unlock_program: 3)
prog7 = Program.create!(title: "Gérer son temps", description: "Vous ne savez pas par où commencer, vous vous perdez souvent dans des détails et y consacrez trop de temps. Apprenez à gérer au mieux votre temps pour optimiser votre projet.", unlock_program: 3)
prog8 = Program.create!(title: "Comptabilité", description: "Il est important d'avoir quelques connaissances sur la comptabilité des entreprises afin d'apprendre à bien utiliser vos moyens financiers", unlock_program: 4)
prog9 = Program.create!(title: "Pitch - communication orale", description: "Il est important d'être capable de présenter votre projet. Apprenez les tecniques de pitch et entrainez vous à développer vos idées.", unlock_program: 5)
prog10 = Program.create!(title: "Maitriser Instagram", description: "Devenez un expert de l'utilisation d'instagram à des fins professionnels et boostez votre campagne Marketing.", unlock_program: 5)
prog11 = Program.create!(title: "Prévenir le burnout", description: "Il vaut mieux prévenir que guérir ! Cette formation vous donne toutes les clés pour identifier, gérer et / ou éviter le burnout.", unlock_program: 3)

puts "11 programs créés"

#création des relations entre les users et les programs

users.each do |user|
  up = UsersProgram.new(status: 'done')
  up.user = user
  up.final_test_status = "done"
  up.program = prog1
  up.save
end

users.each do |user|
  up = UsersProgram.new(status: 'done')
  up.final_test_status = "done"
  up.user = user
  up.program = prog2
  up.save
end

up = UsersProgram.new(status: "in progress")
up.user = momo
up.program = prog3
up.completion = 50
up.save


up = UsersProgram.new(status: "in progress")
up.user = momo
up.program = prog4
up.completion = 30
up.save

up = UsersProgram.new(status: "done")
up.user = clem
up.final_test_status = "done"
up.program = prog4
up.save

up = UsersProgram.new(status: "done")
up.user = clem
up.final_test_status = "done"
up.program = prog5
up.save

up = UsersProgram.new(status: "done")
up.user = clem
up.final_test_status = "done"
up.program = prog6
up.save

up = UsersProgram.new(status: "in progress")
up.user = clem
up.completion = 70
up.program = prog7
up.save

up = UsersProgram.new(status: "done")
up.user = clem
up.final_test_status = "done"
up.program = prog8
up.save

puts "relations entre users et programmes créées"

#création des lessons

lesson1 = Lesson.new(title: "À bout de forces", description: "Savoir faire la différence entre le stress ou le surmenage et le burnout.", number: 1)
lesson1.program = prog11
lesson1.save

lesson2 = Lesson.new(title: "Les facteurs de risque", description: "Reconnaître les facteurs de risque de burnout" , number: 2)
lesson2.program = prog11
lesson2.save

lesson3 = Lesson.new(title: "Lutter contre le stress", description: "Définir ses priorités. Apprendre les méthodes de relaxation adaptées", number: 3)
lesson3.program = prog11
lesson3.save

lesson4 = Lesson.new(title: "Le burnout ne passera pas", description: "Découvrir quels facteurs liés à l'entrepreneuriat favorisent le burnout", number: 4)
lesson4.program = prog11
lesson4.save

lesson5 = Lesson.new(title: "La vie après le burnout", description: "Apprendre à faire désormais les choses différemment", number: 5)
lesson5.program = prog11
lesson5.save



puts "5 lessons créées"

#création des steps des lessons

step1 = Step.new(number:1, title: "Qu'est-ce que le burnout", url:"https://www.youtube.com/embed/KRsYGksCu0I", media_type:"video")
step1.lesson = lesson1
step1.save

step2 = Step.new(title: "Bien repérer les signes", number: 2, url:"https://medium.com/oser-r%C3%AAver-sa-carri%C3%A8re/burn-out-signes-annonciateurs-et-sympt%C3%B4mes-b88cab5a4d9a", media_type:"text")
step2.lesson = lesson1
step2.save

step3 = Step.new(number: 3, title: "Témoignage", url: "https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/574068165&color=%23ff5500&auto_play=false&hide_related=false&show_comments=true&show_user=true&show_reposts=false&show_teaser=true&visual=true", media_type: "podcast")
step3.lesson = lesson1
step3.save

step4 = Step.new(number: 4, title:"Différencier stress et burnout", url:"https://www.youtube.com/embed/KYXK1UsuK9I", media_type:"video")
step4.lesson = lesson1
step4.save

#-------------------------------

step1 = Step.new(number:1, title: "Les facteurs de risque", url:"https://click.edenred.fr/edenredv2/inline-images/edenred-prevenir_les_mauxtravail-0418-2.jpg", media_type:"text")
step1.lesson = lesson2
step1.save

step2 = Step.new(title: "Identification des différents symptomes", number: 2, url:"https://player.ausha.co/index.html?podcastId=odNJDcvDX8Aa&v=3&playerId=ausha-firL", media_type:"podcast")
step2.lesson = lesson2
step2.save

step3 = Step.new(number: 3, title: "Reportage sur le burnout", url: "https://www.youtube.com/embed/VWC6Y1gimDI", media_type: "video")
step3.lesson = lesson2
step3.save

step4 = Step.new(number: 4, title:"Êtes-vous sujet au burnout ?", url:"https://www.apprivoisersonstress.ca/outils/autoevaluation-epuisement-professionnel-burnout/", media_type:"text")
step4.lesson = lesson2
step4.save

#-------------------------------

step1 = Step.new(title: "Définir le stress", number: 1, url:"https://www.franceculture.fr/player/export-reecouter?content=59e36844-5d4a-11e5-a571-005056a87c89", media_type:"podcast")
step1.lesson = lesson3
step1.save

step2 = Step.new(number: 3, title: "Sophrologie anti-stress", url: "https://www.youtube.com/embed/CK6OMG_5LMQ", media_type: "video" )
step2.lesson = lesson3
step2.save

step3 = Step.new(number: 2, title: "Surmenage, stress et burnout", url: "https://www.franceculture.fr/player/export-reecouter?content=f218409a-49ec-4c27-8f95-a005a64bf3da", media_type: "podcast")
step3.lesson = lesson3
step3.save

step4 = Step.new(number:4, title: "Maitriser son stress", url:"https://biendanstaboite.fr/7-conseils-pour-gerer-son-stress-quand-on-est-entrepreneur/", media_type:"text")
step4.lesson = lesson3
step4.save

#-------------------------------

step1 = Step.new(title: "Le burnout des entrepreneurs", number: 1, url:"https://www.maddyness.com/2020/01/24/burnout-difficile-realite-fondateur/", media_type: "text")
step1.lesson = lesson4
step1.save

step2 = Step.new(number: 2, title: "Ne pas s'enfermer, communiquer !", url: "https://business.lesechos.fr/entrepreneurs/aides-reseaux/dossiers/Entrepreneurs-votre-sante-est-precieuse/burn-out-de-l-entrepreneur-ne-vous-enfermez-pas-et-parlez-de-vos-difficultes-206187.php", media_type: "text")
step2.lesson = lesson4
step2.save

step3 = Step.new(number: 3, title: "Témoignage d'un entrepreneur", url: "https://www.youtube.com/embed/EfTaZp2vOSo", media_type: "video" )
step3.lesson = lesson4
step3.save

step4 = Step.new(number:4, title: "Comment éviter d'être à bout ?", url: "https://widget.spreaker.com/player?episode_id=15537631&theme=light&autoplay=false&playlist=false&cover_image_url=https%3A%2F%2Fd3wo5wojvuv7l.cloudfront.net%2Fimages.spreaker.com%2Foriginal%2F29b0a476ca366cb415c0cf5d54ea06e3.jpg", media_type: "podcast")
step4.lesson = lesson4
step4.save

#-------------------------------

step1 = Step.new(title: "Du burnout à la performance", number: 1, url:"https://www.youtube.com/embed/o5fC4EzPjD0", media_type:"video")
step1.lesson = lesson5
step1.save

step2 = Step.new(number: 2, title: "Apprendre à faire différemment", url: "https://www.youtube.com/embed/Q796IzWYBis", media_type: "video")
step2.lesson = lesson5
step2.save

step3 = Step.new(number: 3, title: "Témoignages", url: "https://www.helloworkplace.fr/burn-out-et-apres-ils-racontent-leur-retour-au-travail/", media_type: "text" )
step3.lesson = lesson5
step3.save

step4 = Step.new(number:4, title: "Retrouver du sens après un burnout", url:"https://player.ausha.co/index.html?podcastId=owgpVCLj4RkA&v=3&playerId=ausha-n8lH", media_type:"podcast")
step4.lesson = lesson5
step4.save

puts "steps des lessons créés"

#relation entre momo et program 11

up2 = UsersProgram.new(status: "in progress")
up2.user = momo
up2.program = prog11
up2.completion = 80
up2.save

up2.last_lesson_id = lesson5.id
up2.last_step_id = step2.id
up2.save

#création d'un final test pour program 11

ft = FinalTest.new(description: "Maintenant que vous en savez beaucoup plus sur le burnout, vous êtes en mesure d'entreprendre votre projet tout en prenant soin de vous et de votre santé. Pour finaliser votre apprentissage, nous vous proposons une étude de cas. Projetez-vous à 2 ans après votre création d'entreprise. Votre activité se porte bien, vous êtes en phase de croissance, et vous recrutez de façon intensive. Votre vie ne se résume presque plus qu'à votre travail et vous commencez à sentir une intense fatigue et des effets négatifs sur votre vie personnelle. Comment devriez-vous réagir face à cette situation ?",
                    objectifs: "Listez les potentielles dérives de cette situation d'un point de vue personnel, et proposez des actions vous permettant de vivre cette expérience positive de façon sereine et durable.")
ft.program = prog11
ft.save

puts "1 final test créé"

#création d'un quiz pour lesson 5
quiz = Quiz.new
quiz.lesson = lesson5
quiz.save

puts "1 quiz créé"
#création des questions pour le quiz

question1 = Question.new(description: "Qu'est-ce que le burnout ?", number: 1)
question1.quiz = quiz
question1.save

question2 = Question.new(description: "Quels symptômes sont directement liés au burnout ?", number: 2)
question2.quiz = quiz
question2.save

question3 = Question.new(description: "Quelle situation est la plus critique ?", number: 3)
question3.quiz = quiz
question3.save

question4 = Question.new(description: "Comment éviter le burnout en tant qu'entrepreneur ?", number: 4)
question4.quiz = quiz
question4.save

question5 = Question.new(description: "Comment rebondir après un burnout ?", number: 5)
question5.quiz = quiz
question5.save

puts "5 questions du quiz créées"

#création des réponses pour les questions

answer1 = Answer.new(content: "Un problème de stress", correct: false)
answer1.question = question1
answer1.save

answer2 = Answer.new(content: "Une dépression", correct: false)
answer2.question = question1
answer2.save

answer3 = Answer.new(content: "Un épuisement professionnel", correct: true)
answer3.question = question1
answer3.save

answer4 = Answer.new(content: "Une excuse pour arrêter de travailler", correct: false)
answer4.question = question1
answer4.save

#-------------------------------

answer1 = Answer.new(content: "Isolement, anxiété, fatigue", correct: true)
answer1.question = question2
answer1.save

answer2 = Answer.new(content: "Stress, phobie de l'échec", correct: false)
answer2.question = question2
answer2.save

answer3 = Answer.new(content: "Paranoïa, agoraphobie", correct: false)
answer3.question = question2
answer3.save

answer4 = Answer.new(content: "Maux de tête", correct: false)
answer4.question = question2
answer4.save

#-------------------------------

answer1 = Answer.new(content: "Je travaille 50 heures par semaine", correct: false)
answer1.question = question3
answer1.save

answer2 = Answer.new(content: "Je rêve de mon travail toutes les nuits", correct: false)
answer2.question = question3
answer2.save

answer3 = Answer.new(content: "Je n'arrive plus à me lever le matin", correct: true)
answer3.question = question3
answer3.save

answer4 = Answer.new(content: "Faire les seeds de cette app", correct: false)
answer4.question = question3
answer4.save

#-------------------------------

answer1 = Answer.new(content: "En déléguant toutes les tâches", correct: false)
answer1.question = question4
answer1.save

answer2 = Answer.new(content: "En dédiant sa vie à son projet", correct: false)
answer2.question = question4
answer2.save

answer3 = Answer.new(content: "En abandonnant après l'échec", correct: false)
answer3.question = question4
answer3.save

answer4 = Answer.new(content: "En privilégiant le plaisir à la performance", correct: true)
answer4.question = question4
answer4.save

#-------------------------------

answer1 = Answer.new(content: "En se focalisant sur ses aspirations personnelles", correct: true)
answer1.question = question5
answer1.save

answer2 = Answer.new(content: "En se lançant immédiatement dans un nouveau projet", correct: false)
answer2.question = question5
answer2.save

answer3 = Answer.new(content: "En abandonnant l'idée d'entreprendre", correct: false)
answer3.question = question5
answer3.save

answer4 = Answer.new(content: "En partant en vacances", correct: false)
answer4.question = question5
answer4.save

#-------------------------------

puts "réponses du quiz créées"

lesson1 = Lesson.new(title: "Pensez autrement", description: "Découvrir les cinq étapes du Design Thinking.", number: 1)
lesson1.program = prog1
lesson1.save

lesson2 = Lesson.new(title: "À votre place", description: "Reconnaître l’importance de l’empathie dans le processus de Design Thinking." , number: 2)
lesson2.program = prog1
lesson2.save

lesson3 = Lesson.new(title: "Découverte de l’année", description: "Utiliser des techniques de création pour générer un maximum de solutions.", number: 3)
lesson3.program = prog1
lesson3.save

lesson4 = Lesson.new(title: "Eurêka !", description: "Concevoir un prototype pour tester une idée.", number: 4)
lesson4.program = prog1
lesson4.save

lesson5 = Lesson.new(title: "La voie de la réussite", description: "Se donner les moyens nécessaires pour réussir le processus de Design Thinking.", number: 5)
lesson5.program = prog1
lesson5.save

puts "5 lessons créées"

step1 = Step.new(number:1, title: "Les étapes du Design Thinking", url:"https://www.youtube.com/embed/Irt6p39rC8Q", media_type:"video")
step1.lesson = lesson1
step1.save

step1 = Step.new(number:1, title: "Les étapes du Design Thinking", url:"https://www.youtube.com/embed/Irt6p39rC8Q", media_type:"video")
step1.lesson = lesson2
step1.save

step1 = Step.new(number:1, title: "Les étapes du Design Thinking", url:"https://www.youtube.com/embed/Irt6p39rC8Q", media_type:"video")
step1.lesson = lesson3
step1.save

step1 = Step.new(number:1, title: "Les étapes du Design Thinking", url:"https://www.youtube.com/embed/Irt6p39rC8Q", media_type:"video")
step1.lesson = lesson4
step1.save

step1 = Step.new(number:1, title: "Les étapes du Design Thinking", url:"https://www.youtube.com/embed/Irt6p39rC8Q", media_type:"video")
step1.lesson = lesson5
step1.save

up = UsersProgram.where(user: momo, program: prog1).first
up.last_lesson_id = lesson5.id
up.last_step_id = step1.id
up.save

up = UsersProgram.where(user: marg, program: prog1).first
up.last_lesson_id = lesson5.id
up.last_step_id = step1.id
up.save

up = UsersProgram.where(user: clem, program: prog1).first
up.last_lesson_id = lesson5.id
up.last_step_id = step1.id
up.save


puts "5 steps créés"

lesson1 = Lesson.new(title: "Notions de bilan", description: "Comprendre ce qu'est l'actif et le passif du bilan et connaitre les principaux postes.", number: 1)
lesson1.program = prog8
lesson1.save

lesson2 = Lesson.new(title: "Enregistrer les achats", description: "Enregistrer comptablement les factures d'achat.", number: 2)
lesson2.program = prog8
lesson2.save

lesson3 = Lesson.new(title: "Enregistrer les ventes", description: "Enregistrer les fcatures de vente, en respectant le principe de la partie double", number: 3)
lesson3.program = prog8
lesson3.save

lesson4 = Lesson.new(title: "La TVA", description: "Introduire la TVA dans les factures", number: 4)
lesson4.program = prog8
lesson4.save

lesson5 = Lesson.new(title: "Calcul du résultat", description: "Calculer le résultat à partir des opérations de vente et d'achat", number: 5)
lesson5.program = prog8
lesson5.save

step1 = Step.new(title: "Bienvenue en Compta", number: 1, url:"https://www.youtube.com/embed/mG7O1WKxrdg", media_type:"video")
step1.lesson = lesson1
step1.save

puts "5 leçons additionnelles créées"


User.create!(username: "emmy", email: "emmy@email.com", password: "azerty", level: 7, xp: 200, last_sign_in_at: (Date.today - 12), days_streak: 12)
User.create!(username: "andrew", email: "andrew@email.com", password: "azerty", level: 2, xp: 300, last_sign_in_at: (Date.today - 2), days_streak: 2)
User.create!(username: "lisa", email: "lisa@email.com", password: "azerty", level: 6, xp: 100, last_sign_in_at: Date.today, days_streak: 6)
User.create!(username: "val", email: "valentine@email.com", password: "azerty", level: 1, xp: 200, last_sign_in_at: (Date.today - 1), days_streak: 1)
User.create!(username: "louis", email: "louis@email.com", password: "azerty", level: 4, xp: 800, last_sign_in_at: (Date.today - 2), days_streak: 2)
User.create!(username: "elody", email: "elody@email.com", password: "azerty", level: 5, xp: 100, last_sign_in_at: Date.today, days_streak: 0)

puts "6 users créés"
