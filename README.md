# Nutrition---Long-vit-
Étude de l'impact de la nutrition sur la longévité  le bien-être
Correction des erreurs dans la colonne Protein

Nous avons détecté des incohérences dans la colonne Protein de notre dataset.  
Pour assurer l’exactitude des données, nous avons mis à jour certaines valeurs incorrectes.

Modifications appliquées :
Water : 50g → **0g** de protéines (correction d’une erreur)
Chips: 50g → **7g** de protéines (valeur plus réaliste)
Broccoli: 50g → **3g** de protéines (valeur plus réaliste)

Requête SQL utilisée** : [`update_protein_correction.sql`](./update_protein_correction.sql)
