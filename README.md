# Hand-off simulation
Simulation of Hand-Off in Cellular Networks in MATLAB
## Functions
### RSS
This function is used to calculate the RSS for each base station. All the properties that are needed for calculation (“R” and “L” and speed, etc.) are clarified at the top of the function.
I have almost used “project1.m” to create this function.

### RSS_HandOff
Algorithm: Simple RSS
This function takes the RSS of four base stations, and based on the maximum of RSS, decide which base station must be chosen. It only compares the RSS and determines the base station with the maximum of RSS. It returns a vector with the name of the optimum base station at every location.

### RSSth_HandOff
Algorithm: RSS with threshold
This function is written for handoff decision based on a threshold which is given in the input. It is just like “RSS_HandOff” and also checks if the RSS of the base station is less than the threshold, then chooses the base station with the maximum of RSS.

### RSShys_HandOff
Algorithm: RSS with hysteresis
Just like previous functions, it decides the optimum base station. In this case, by using a constant number, which is named “hysteresis”.

### RSSthys_HandOff
Algorithm: RSS with threshold and hysteresis
It used a threshold and hysteresis to determine the optimum base station.

### ProbabilityRSS
This function iterates a specific loop for “prob_num” times in input. At each loop creates an RSS profile, determines the name of the optimum base station at every location by “RSS_HandOff” and saves the number of handoffs at every loop for the number of handoffs and number of handoffs at every location in total for the location of handoffs.

### ProbabilityRSSth, ProbabilityRSShys, ProbabilityRSSthys
These functions are like “ProbabilityRSS”, just different in the handoff decision function.

### HowMuchHO
It calculates the total number of handoffs.

### Count
It takes a vector with the name of base stations in each cell and counts how many times a specific number of handoffs happens.

### CountL
It takes a vector that includes the name of base stations and returns a vector with "0" or "1" elements. "0" shows that at this location, no handoff happened, and for "1", a handoff happened.
 


## Channel profile, which is the RSS from each of the base stations

By using “RSS.m”

[RSS1 , RSS2 , RSS3 , RSS4] = RSS()
![image](https://user-images.githubusercontent.com/47606879/142786337-793f1886-56eb-443c-8af9-fb35d7859a55.png)




## Probability Density Function (PDF) of number of handoffs

By using “ProbabilityRSS.m” and “Count.m”

[PROBAB , LOC] = PROBABILITYRSS(NS , PN);
[C, N] = COUNT(PROBAB);
PLOT(N , C/PN);
 
 
 ![image](https://user-images.githubusercontent.com/47606879/142786360-790e90fc-db13-4d6d-9930-f605896db692.png)
![image](https://user-images.githubusercontent.com/47606879/142786378-00f65724-ae97-4ccd-9251-0be2ada48648.png)
![image](https://user-images.githubusercontent.com/47606879/142786384-6fa9fac2-77cf-4dff-bdd2-0d4bd664e7b2.png)
![image](https://user-images.githubusercontent.com/47606879/142786390-4879f01a-62e8-4547-96f2-cb349f2469a1.png)
![image](https://user-images.githubusercontent.com/47606879/142786399-f8d9639e-5551-47b4-9553-747e82dbc02d.png)


 
 
## Histogram
	 
![image](https://user-images.githubusercontent.com/47606879/142786457-ac6964a1-712f-4eb8-bbbd-43d731297b6f.png)
![image](https://user-images.githubusercontent.com/47606879/142786460-8b0bd078-d476-4498-9c6e-34cf2bb467f0.png)
![image](https://user-images.githubusercontent.com/47606879/142786461-261ef6d8-a7a1-401a-b615-4e1ffd65450d.png)
![image](https://user-images.githubusercontent.com/47606879/142786465-263b9391-beff-4b58-b2e2-4895c70da72b.png)
![image](https://user-images.githubusercontent.com/47606879/142786469-36ee5087-ef5d-42cf-bdc0-c73eef6a67dd.png)


 
 
 

## Probability Density Function (PDF) of hand off location

By using “ProbabilityRSS.m”

[PROBAB , LOC] = PROBABILITYRSS(NS , PN);
PLOT(D1 , LOC/PN)
 
 ![image](https://user-images.githubusercontent.com/47606879/142786478-1a5ae037-c777-42a7-ba6d-a2305bc33a0e.png)
![image](https://user-images.githubusercontent.com/47606879/142786481-b4bc61f4-6ffe-4fd1-abc6-d48a5c150168.png)
![image](https://user-images.githubusercontent.com/47606879/142786486-5bbd6985-10c5-4da7-a68b-7f5276a851db.png)
![image](https://user-images.githubusercontent.com/47606879/142786490-5972e518-6328-493f-9e73-ed0bc833493a.png)
![image](https://user-images.githubusercontent.com/47606879/142786497-46de9ec8-e829-46d0-a6de-bc1222dc92cf.png)

 
 
 
## Histogram

 
![image](https://user-images.githubusercontent.com/47606879/142786505-a1e941d2-1885-442e-9789-da9f1061c339.png)
![image](https://user-images.githubusercontent.com/47606879/142786508-70c4dae6-fcdc-4648-9c75-680ffa1d881b.png)
![image](https://user-images.githubusercontent.com/47606879/142786513-7c9dd916-0a53-429e-bef2-0221a322ef31.png)
![image](https://user-images.githubusercontent.com/47606879/142786518-5c822d30-b194-48ec-a3f8-014f331414aa.png)
![image](https://user-images.githubusercontent.com/47606879/142786523-966b9587-bbc1-4878-bf21-9ddc4c043162.png)

 
 
 

 
## Note : 
•	For checking the simulation, please use “main.m” file.
•	Mentioned simulation results are using different loop length. 2000 for Simple RSS and RSS with threshold and 5000 for RSS with hysteresis and RSS with threshold and hysteresis but loop length for histograms is 100. The actual loop length in the main file is 100.
•	These images are the result of the simulation with loop length equal to 100.

![image](https://user-images.githubusercontent.com/47606879/142786556-192d28e4-5bdf-4009-82b2-d8241076e18e.png)
![image](https://user-images.githubusercontent.com/47606879/142786566-3e1cd335-d9e8-47f3-9be7-fcd1da96ef15.png)
![image](https://user-images.githubusercontent.com/47606879/142786569-46ae9721-3cb8-45e4-91a7-b8dc4f0ade68.png)
![image](https://user-images.githubusercontent.com/47606879/142786576-33e0032a-9651-40b1-b542-647b17b9bb42.png)
![image](https://user-images.githubusercontent.com/47606879/142786578-797357ff-e534-49d3-8a6c-a98c7573ace9.png)![image](https://user-images.githubusercontent.com/47606879/142786585-07c75549-1e93-4b0f-a4b0-bd4e7bc3e7f4.png)
![image](https://user-images.githubusercontent.com/47606879/142786597-8d725e8c-b3c7-4b91-a64c-47cf48a437e0.png)![image](https://user-images.githubusercontent.com/47606879/142786602-b126d489-7077-4713-8fbd-ee18c4e03b2f.png)
![image](https://user-images.githubusercontent.com/47606879/142786607-041a2909-6594-4080-b53d-e027002d75ef.png)![image](https://user-images.githubusercontent.com/47606879/142786617-e98a4cdf-7d97-4584-aa88-210b1dd65403.png)

  
 	 
 	 
 	 


