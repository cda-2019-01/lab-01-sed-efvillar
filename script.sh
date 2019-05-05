# Escriba su código aquí
#
#Convierta el formato de las fechas de DD/MM/YY a YYYY-MM-DD.
    # Estrategia: encontrar con expresiones regulares el patron DD/MM/YY y guardar el memoria DD MM YY
    #luego reemplazar por YY-MM-DD
    #se usan \ antes de / para escape pues se confundiría con los límites de la expresión regular
    #en el pipeline se genera el archivo temporal data1.csv
    #al colocar el año que es la tercera variable de una vez se le agrega la constante (str) 20 para tranformar YY a YYYY
    #asumiendo que todas las fechas son después del año 2000
#
sed 's/\([0-9][0-9]\)\/\([0-9][0-9]\)\/\([0-9][0-9]\)/20\3-\2-\1/' data.csv > deta1.csv
#
#
#Transforme el archivo para que todos los campos nulos aparezcan como \N.
    #estrategia: en el archivo existen dos tipos de campor nulos
    #1. N a las que les falta el string \. siempre empiezan con ;
    #2. los campos en blanco
    #para el caso 1:  tener en cuenta que se requiere un caracter de escape
sed 's/;N/;\\N/' deta1.csv > deta2.csv
    #para el caso 2
    #identificar los espacios en blanco, es decir dos ;; seguidas 
    #y reemplazar por ;\N; con un caracter de escape \
sed 's/;;/;\\N;/' deta2.csv > deta3.csv
    #existe un caso adicional cuando hay un null sin datos en la ultima columna
    #en este caso la linea termina con ;
    #pero antes se debe corregir el caso en el cual hoy 5 columnas pues erradamente se colocó ; en lugar de , como decimal en la ultima fila
sed 's/\([0-9][0-9][0-9]\);\([0-9]\)/\1,\2/' deta3.csv > deta4.csv
    #falta caso de nulo en la ultima columna
#sed 's/\(.*\)/\1;/gm' data4.csv > data4_1.csv
#
#
# Use el . para indicar decimales
    #se ejeucta antes de reemplazar ; por , para evitar conflictos
sed 's/\([0-9][0-9][0-9]\),\([0-9]\)/\1.\2/' deta4.csv > deta5.csv
#
#
# reemplazar ; por ,
    #caso elemental utilizando g para sustitución global
sed 's/;/,/g' deta5.csv > deta6.csv
#
#extraer registros sin campo nulo
    #Estrategia: se busca el patron \n y se borran las líneas que tengan ese patron
sed '/\\n/d' deta6.cvs > data_final.csv
#
#se borran los archivos temporales
rm deta*