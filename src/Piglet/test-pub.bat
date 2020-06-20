
java -jar piglet.jar ./testcases/pub/BinaryTree.pg 		> ./testcases/pub/BinaryTree.spg
java -jar piglet.jar ./testcases/pub/BubbleSort.pg		> ./testcases/pub/BubbleSort.spg	
java -jar piglet.jar ./testcases/pub/Factorial.pg		> ./testcases/pub/Factorial.spg
java -jar piglet.jar ./testcases/pub/LinearSearch.pg	> ./testcases/pub/LinearSearch.spg
java -jar piglet.jar ./testcases/pub/LinkedList.pg 		> ./testcases/pub/LinkedList.spg
java -jar piglet.jar ./testcases/pub/MoreThan4.pg		> ./testcases/pub/MoreThan4.spg
java -jar piglet.jar ./testcases/pub/QuickSort.pg		> ./testcases/pub/QuickSort.spg
java -jar piglet.jar ./testcases/pub/TreeVisitor.pg		> ./testcases/pub/TreeVisitor.spg

java -jar pgi.jar < ./testcases/pub/BinaryTree.spg		> ./testcases/pub/BinaryTree.spg.txt
java -jar pgi.jar < ./testcases/pub/BubbleSort.spg		> ./testcases/pub/BubbleSort.spg.txt
java -jar pgi.jar < ./testcases/pub/Factorial.spg 		> ./testcases/pub/Factorial.spg.txt
java -jar pgi.jar < ./testcases/pub/LinearSearch.spg 	> ./testcases/pub/LinearSearch.spg.txt
java -jar pgi.jar < ./testcases/pub/LinkedList.spg 		> ./testcases/pub/LinkedList.spg.txt
java -jar pgi.jar < ./testcases/pub/MoreThan4.spg 		> ./testcases/pub/MoreThan4.spg.txt
java -jar pgi.jar < ./testcases/pub/QuickSort.spg 		> ./testcases/pub/QuickSort.spg.txt
java -jar pgi.jar < ./testcases/pub/TreeVisitor.spg 	> ./testcases/pub/TreeVisitor.spg.txt

java -jar pgi.jar < ./testcases/pub/BinaryTree.pg		> ./testcases/pub/BinaryTree.txt
java -jar pgi.jar < ./testcases/pub/BubbleSort.pg 		> ./testcases/pub/BubbleSort.txt
java -jar pgi.jar < ./testcases/pub/Factorial.pg 		> ./testcases/pub/Factorial.txt
java -jar pgi.jar < ./testcases/pub/LinearSearch.pg 	> ./testcases/pub/LinearSearch.txt
java -jar pgi.jar < ./testcases/pub/LinkedList.pg 		> ./testcases/pub/LinkedList.txt
java -jar pgi.jar < ./testcases/pub/MoreThan4.pg 		> ./testcases/pub/MoreThan4.txt
java -jar pgi.jar < ./testcases/pub/QuickSort.pg 		> ./testcases/pub/QuickSort.txt
java -jar pgi.jar < ./testcases/pub/TreeVisitor.pg 	> ./testcases/pub/TreeVisitor.txt

java -jar spp.jar < ./testcases/pub/BinaryTree.spg
java -jar spp.jar < ./testcases/pub/BubbleSort.spg
java -jar spp.jar < ./testcases/pub/Factorial.spg
java -jar spp.jar < ./testcases/pub/LinearSearch.spg
java -jar spp.jar < ./testcases/pub/LinkedList.spg
java -jar spp.jar < ./testcases/pub/MoreThan4.spg
java -jar spp.jar < ./testcases/pub/QuickSort.spg
java -jar spp.jar < ./testcases/pub/TreeVisitor.spg

java FileComparator ./testcases/pub/BinaryTree.txt 	./testcases/pub/BinaryTree.spg.txt
java FileComparator ./testcases/pub/BubbleSort.txt 	./testcases/pub/BubbleSort.spg.txt
java FileComparator ./testcases/pub/Factorial.txt 		./testcases/pub/Factorial.spg.txt
java FileComparator ./testcases/pub/LinearSearch.txt 	./testcases/pub/LinearSearch.spg.txt
java FileComparator ./testcases/pub/LinkedList.txt 	./testcases/pub/LinkedList.spg.txt
java FileComparator ./testcases/pub/MoreThan4.txt 		./testcases/pub/MoreThan4.spg.txt
java FileComparator ./testcases/pub/QuickSort.txt 		./testcases/pub/QuickSort.spg.txt
java FileComparator ./testcases/pub/TreeVisitor.txt 	./testcases/pub/TreeVisitor.spg.txt

pause


