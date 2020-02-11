# Binary Search
Binary Search performed on the sorted array. An sorted array repeatedly is dividing the search interval in half. Search begins with the complete sorted array and later divide the array into half. Compare the mid value and the serach key if it is matching,the key is found. If the key is less then the middle element, search the element in the first half otherwise search it in second half of an array. Repeate the same until the search key is found. If the key is not found return index of value -1.

![Binary Search](https://upload.wikimedia.org/wikipedia/commons/thumb/8/83/Binary_Search_Depiction.svg/1920px-Binary_Search_Depiction.svg.png)

# Pseudo Code
```
i <- 0
j <- n
while i < j
    mid <- (i+j)/2
    return mid if arr[i] == a[mid] # Element is already found
    if arr[i] < a[mid]
        j <- mid - 1
    else
        i <- mid - 1
    end
end
return -1 # If the element is not found
```
# Time and Space Complexity
|                 |               |
| --------------- |:-------------:|
| Worst-case performance| O(log n) |
| Best-case performance	| O(1) | 
| Average performance	| O(log n) |
| Worst-case space complexity | O(1) |

	
