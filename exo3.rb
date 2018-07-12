exiger  ' rubygems '
exiger  ' nokogiri '
exiger  ' open-uri '
exiger  ' pry '

def  depute_list
  mp_list = []
  doc =  Nokogiri :: HTML ( ouvrir ( " https://www.nosdeputes.fr/deputes " ))
  doc.xpath ( ' // td / a ' ) .each faire | noeud |
    mp_list << node [ ' href ' ]
  fin
  return mp_list
fin

def  coordonne_depute ( urls )
  list = []
  urls.each faire | url |
    hash = {}
    url =  " https://www.nosdeputes.fr # { url } "
    doc =  Nokogiri :: HTML ( open ( " # { url } " ))
    hash [ : names ] = doc.xpath ( ' // h1 ' ) .text
    hash [ : emails ] = doc.xpath ( ' / html / corps / div [1] / div [5] / div / div [2] / div [1] / ul [2] / li [1] / ul / li [1] / a ' ) .text
    liste << hash
  fin
  liste de retour
fin

def  effectuer
  list = coordonne_depute (depute_list)

  fname =  " mailing_list_depute.txt "
	unfichier =  Fichier . open (fname, " w " )
	un fichier. met (liste)
	unfichier.close
fin

effectuer