# Escriba su código aquí
start_time=$(date +%s)
#Ejecución
echo '-------------------------------------------'
echo '•	Copia de las data e ingresar el numero de linea'
echo '-------------------------------------------'
for file in *.csv; do awk '{print NR "," $s}' $file > "$(basename "$file" .csv)_1.csv"; done
echo '-------------------------------------------'
echo '•	Agregar el nombre de la data'
echo '-------------------------------------------'
sed 's/\([0-9]\),\([A-Z]\)/data1.csv,\1,\2,/g' data1_1.csv > data1_2.csv
sed 's/\([0-9]\),\([A-Z]\)/data2.csv,\1,\2,/g' data2_1.csv > data2_2.csv
sed 's/\([0-9]\),\([A-Z]\)/data3.csv,\1,\2,/g' data3_1.csv > data3_2.csv
echo '-------------------------------------------'
echo '•	Eliminar espacio en blanco'
echo '-------------------------------------------'
sed 's/[[:space:]]//' data1_2.csv > data1_3.csv
sed 's/[[:space:]]//' data2_2.csv > data2_3.csv
sed 's/[[:space:]]//' data3_2.csv > data3_3.csv
echo '-------------------------------------------'
echo '•	crear data final'
echo '-------------------------------------------'
awk -F',' '{ for(i=4;i<=NF;i++) print $1,$2,$3,$i}' OFS=',' *_3.csv > data.csv
echo '-------------------------------------------'
echo '•	Imprimir data final'
echo '-------------------------------------------'
cat data.csv
echo '-------------------------------------------'
echo '•	Eliminar datas temporales'
echo '-------------------------------------------'
rm *_1.csv
rm *_2.csv
rm *_3.csv

finish_time=$(date +%s)
echo "Time duration: $((finish_time - start_time)) secs."
