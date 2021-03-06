---
title: "Arduino-Phone"
description: "Two-way real world communication"
slug: "arduino-phone"
date: "2021-04-19"
image: "pair_banner.jpg"
categories:
    - Blog
    - Arduino
tags:
    - Arduino
    - Arduino-Phone
    - Two-way transmission
---

<!-- What are we building? -->
### What is this... ard-wino-fone?
We are going to build a small three-LED arduino communication device, known as the **Arduino-Phone**.
The device will be able to send 3 different signals to its counterpart, and shall also be able to receive these signals back.
The device is operated using simple buttons and will display the reception or transmission using its LEDs.
The Arduino-Phone definitely does not fall into the category of *revolutionary technology*, but still is a pretty cool device.

<!-- What does it look like -->
The layout of the system will look something like this (left) and the final product will look this (right).
![overview of system](schematic(2).png) ![yes, I know... she is a miracle of amazement](device_finished1.jpeg)

### Stuff
Everything you need in order to build a single Arduino-Phone is roughly worth €10. These are the parts that are used up:
- RF-nano ~ €5 (Arduino-nano integrated with nRF24L01 transceiver) 
- components ~ €5 (buy a pack)
  - 3 LEDs 
  - 3 Buttons
  - 2 resistors

Additionally you need some soldering equipment and some hobby tools. These you can use again (or will only require a little piece):
- soldering iron (any soldering iron is good enough)
- solder
- USB to micro-USB cable (you've got this laying around somewhere)
- wire
- pliers (for cutting and holding)
- carton and scissors
- glue
  
![RF-nano](rs_RF-nano1.jpeg) ![USB to micro-USB (data) cable](rs_cable.jpeg) ![3 LEDs, 3 buttons and 2 resistors](rs_leds_buttons_resistors.jpeg)

![Soldering iron](rs_soldering_iron.jpeg) ![Wire, only little bit...](rs_wire.jpeg) ![Pliers with cutting blades](pliers.jpeg)

 ![A part of the box these things came in, i.e. carton](rs_boxes2.jpeg) ![The cheapest glue you can find](rs_glue.jpeg) ![Some solder, ideally lead-free](rs_tin.jpeg)

Where can you get your hands on these things?
* Amazon
* Local or online electronics store
* ~~My house~~

<!-- Why do we build it -->
*Why* are we going to build it? Well... --**It is cool and it is cheap**-- Let's ask ourselves later whether it is useful.

<!-- Sidenotes -->
> Sidenotes
> - *When you are following this tutorial yourself, keep in mind a single device will not do much... You will need at least two. This tutorial will only show one.*
> - *A soldering iron is hot*
> - *This device can also just be used to connect to a different kind of actuator. The LEDs can be replaced by a motor and the buttons by a sensor!*
> - *This range of the 2 devices is limited, but I will later explain how to extend this range with an antenna.*
> - *A soldering iron is very hot*
> - *The things touched by the soldering iron also tend to get hot*

<!-- How is it made -->
Lets dive in.

# Build the thing

### Lay it out
Choose the resistors you are going to use carefully, do not use a high resistance for the LEDs (~1kOhm is fine), because you want those **bright lights**. For the button-side, any resistor is okay.
Now have a good look at the schematic, gather your parts and layout all the stuff you are going to use. 
Be sure to set the soldering iron on the side of the table where you'll be working from (do not turn it on yet).
To start, cut out two equal rectangles (~ 8x5cm) of carton with some scissors or a knife (or rip it apart with your bare hands like a beast).
Look at the schematic again, and visualize where the parts are roughly going to be.  

![Layout of the components](materials3.jpeg) ![Carton. I did it with scissor, I must admit](piece_of_carton.jpeg) 
<!-- ![Underside of top carton with the wires and RF-nano layed out](layout_wire_carton_RF-nano_resistors.jpeg) -->

### Pierce the carton
One of the cartons will be on the top surface of the device, so try not to damage it. Having said that, we do need to pierce the LED legs and the button's contacts through it. For the LEDS this is simple, pick the spot and pierce the leg from top to bottom.
> Leave enough room for the RF-nano on the other side to fit in-between the button contacts and the LED legs.

The button contacts might be too short to pierce all the way through your carton. In this case strip away the carton skin to reveal the contacts (see right picture below). This can be done with any sharp tool. I used the single scissor blade, but if you have a katana laying around, that would be... impractical.
![Pierced LEDs through top carton](carton_with_leds2.jpeg)![The high-tech user interface](carton_with_leds_buttons.jpeg)![The underside of the top carton, removed carton skin around the button contacts](carton_with_leds_buttons2.jpeg)

For the legs: once they are pierced through, bend them slightly outward such that they do not fall out. For the button contacts: the pairs closest to the LEDs will be used, otherwise unwanted nano-to-button contact might be made. The other 2x3 button contacts at the edge can be bend towards the middle to fix the button to the carton.

The top carton is done now. But the bottom carton is getting jealous and also wants a piercing. We will imprint the RF-nano pins on this bottom carton on the inside. They will not pierce all the way through, but their imprint will allow smooth alignment later on. For the imprint {{< p >}} place the RF-nano upside-down on the flipped top carton, make sure the USB port is at the edge and the RF-nano is in-between the exposed (centre) button contacts and the LED legs, align the bottom carton, lift the bottom carton together with the RF-nano without shifting it, imprint the bottom carton gently, check the alignment. {{< /p >}}
![Align the top and bottom carton with RF-nano USB port to at side](layout_bottom_carton2.jpeg) ![Imprint the bottom carton](layout_bottom_carton3.jpeg) ![Check the imprint](layout_bottom_carton1.jpeg)

### Prepare the wires
Now, 12 wires must be cut to a fitting length. Try to imagine where all the components will be (look at the schematic) on the underside of the top carton and make the wires 1cm longer than needed. Having cut these ill-fated little lines, we are going to cut them again. However, now only the insulation must be removed. To do this you can get creative (or bite it off like a beast), but the easiest way is to use some cutting pliers and gently cut 0.5cm of the isolation away on either side.

![Cut them](wires_measured.jpeg) ![Cut them again](wire_stripping2.jpeg) ![Lay them out](layout_wire_carton_RF-nano_resistors.jpeg)

Next up, we prepare the wires for the soldering. Guess how? by soldering...

> This part is serious though. Be careful with the soldering iron, **touching it will result in burns**. Also, open a window to let some of those smelly solder-flux-fumes out.

The wires will need to be twisted and "tinned" (applying a little solder), such that proper contact can be made. Use your fingers to twist the little copper wires in the stranded-wire. After this you can turn-on your soldering iron. While the iron is heating (~ 3min) you can clamp the wires somewhere accessible, such that you have two hands available: one for the solder, one for the iron. While clamping, make sure that the wires won't deflect too much when touched.

When the iron is hot {{< p >}} clean the iron tip on a sponge, re-apply some solder to the tip, hold the iron against the exposed wire (2s), bring in the solder at the wire-iron interface (which will melt on the wire) {{< /p >}}

![Pre-twist](wire_tip2.jpeg) ![Post-twist](wire_tip_twisted2.jpeg) ![No-twist (only a plot-twist). Its soldered](wire_tip_tinned1.jpeg)

The last wire-step will be connecting the wires to the resistor (three ground-wires). First attach some solder-wire (with the flux core) to the resistor. Do this by {{< p >}} clamping the resistor, clean iron, reapply solder to iron, heat resistor with iron (2s), bring in the solder, remove the iron and let the solder-wire solidify on the resistor, cut the solder-wire close to the resistor with the iron. {{< /p >}}

Once you have your resistor-solder beauty {{< p >}} clamp the three wires close to each other, clean iron, reapply solder to iron, heat the wires simultaneously (1s), bring in the resistor-solder with pliers, let the solder from the resistor melt on the wires, remove the iron and let it solidify.{{< /p >}} Do this nifty trick twice (credits to [this guy](https://youtu.be/IkjMK26ROcM)).

![Resistor-solder beauty](resistor_wires_tinned2.jpeg) ![Resistor-solder-wires beauty'er](resistor_wires_connected2.jpeg)

### Soldering
Now we are going to solder all the wires and the two resistor-solder-wires to the RF-nano. It is important to keep the RF-nano immobile, which can be achieved with a simple clip or something heavy. First we attach the 2 resistors: one resistor to each ground pin (labelled GND). We can also solder the remaining input-wires to the RF-nano. See the solder plan below.

> In order to make a good mechanical connection and to leave room for the bottom carton I suggest you bend all the to-be-soldered contact pins outward. This will also make identification and soldering easier.

Check out the schematic again and solder all the wires and the two resistors to the appropriate RF-nano pins (6 wires, 2 resistor-solder-wires). We can precede this by putting some solder on the to-be-soldered-to pins: {{< p >}} immobilize the RF-nano, clean iron, reapply solder to iron, heat the to-be-soldered-to pin (3s), bring in the solder, let solder cool down, now grasp to-be-soldered wire/resistor with pliers, reheat the to-be-soldered-to pin with iron, bring in the to-be-soldered wire/resistor, remove the iron and let it solidify. {{< /p >}}

![The soldering plan](schematic_soldering.png) ![The makings of an Arduino-Phone are in sight](RF_nano_final_layout_presolder.jpeg)

Now it gets tricky. Next up are the button contacts, these are the most difficult. Make sure to heat these contacts very well before applying the solder. Same procedure: {{< p >}} camp the carton with the buttons (bottom-side up), clean iron, reapply solder to iron, heat the button contact (5-10s), then bring in solder. {{< /p >}} Leave a little blob of solder on the button contacts, this will be used to connect the wire. Also put some solder on the LED legs.

Now check the schematic one last time, and position the RF-nano octopus top-down in-between the blobs and legs. Now solder the wires to the button contacts and  the LEDs. Procedure: {{< p >}} clamp, clean, reapply, use pliers for holding the wire close to the blob/leg, shortly reheat the blob/leg with the iron, when the solder on the blob/leg melts pull away the iron and leave the wire in, wait for solder to solidify again. {{< /p >}}

![Some solder blobs on the button contacts](RF_nano_buttons_tinned.jpeg) ![Here is a wire soldered to the LED leg](wires_led_connected_closeup.jpeg)

![Here is a wire soldered to the button contact](button_wire_connected_closeup2.jpeg) ![Bob the blob has made contact!](button_wire_connected_closeup.jpeg) 

Now clean your iron, reapply some solder (so it doesn't oxidize the tip) and turn it off.

### Programming
Before you cage this octo/duodeca-pus, let's test if it works. Connect the RF-nano to a computer/laptop with the USB cable and open your C++ interface (Arduino IDE, VS-Code or your own invention).

> So... now the coding part... 

Since RF-nanos can are essentially an Arduino nano combined with a nRF24L01 module, their code for this build is primarily based on the standard nRF24L01 [snippets](https://forum.arduino.cc/t/simple-nrf24l01-2-4ghz-transceiver-demo/405123) available.

{{< scrollsection 600 >}}
`Shift+scroll for sideways scrolling on small screens`
```cpp
# define DEBUG

// Define the pins for the LEDs and the Buttons 
# define gLED 2
# define rLED 3
# define yLED 4

# define gBut 6
# define rBut 7
# define yBut 8

// Define a variable that allocates power to LEDs
short int onLED = 0; // 0:"all off", 1:"green", 2:"red", 3:"yellow"
const short int allocLED[4] = { 0, gLED, rLED, yLED }; // 0 case is excluded in for-loop
const short int allocBut[4] = { 0, gBut, rBut, yBut }; // 0 case is excluded in for-loop

#ifdef DEBUG
const char *LEDnames[4] = { "No led", "Green", "Red", "Yellow" };
#endif

// Include the libraries and set the CE and CSN pins
#include <SPI.h>
#include <nRF24L01.h>
#include <RF24.h>

#define CE_PIN   9
#define CSN_PIN 10

// Create a receiving and transmitting address for the device
//  these are the same since only one is writing at a time (assumption made)
const byte rAddress[5] = "00001"; //receiving on this address
const byte tAddress[5] = "00001"; //transmitting to this address

// Setup a radio
RF24 radio(CE_PIN, CSN_PIN);

// Define communication variables
int rData; // received data
int tData; // transmitted data
bool newData = false; // boolean value to indicate
                      // whether the current step has received new data

// Timing variables
unsigned long currentMillis;
unsigned long previousMillis;
unsigned long intervalMillis = 100; // [ms] send once per 100 miliseconds second when transmitting

// Setup of combi communication RF nano
void setup() {

    // For monitoring
    #ifdef DEBUG
    Serial.begin(9600);
    Serial.println("Combi-communication arduino starting");
    #endif

    // LED output connections
    pinMode(gLED, OUTPUT);
    pinMode(rLED, OUTPUT);
    pinMode(yLED, OUTPUT);

    // Button input connections
    pinMode(gBut, INPUT_PULLUP);
    pinMode(rBut, INPUT_PULLUP);
    pinMode(yBut, INPUT_PULLUP);

    // Setup radio and open reading and writing pipe
    radio.begin();
    radio.setDataRate( RF24_250KBPS );
    
    // Setup writing pipe
    radio.setRetries(3,5); // delay, count : 5 gives a 1500 µsec delay,
                           // which is needed for a 32 byte ackPayload
    radio.openWritingPipe(tAddress);
    
    // Setup reading pipe and start listening to signals
    radio.openReadingPipe(1, rAddress);
    radio.startListening();
}

// Start loop
void loop() {
    bool sending;
    // Check if one of the buttons is pressed --> sending mode
    sending = checkPressed();
    
    // If sending mode, send the transmission data (tData)
    if (sending){
        #ifdef DEBUG
        Serial.println("sending...");
        #endif

        send();
    }
    // Else listen to incoming signals if available
    else{

        listen();
    }

    // Turn on LED when sending tData or when receiving signal
    controlLEDs();
}

bool checkPressed(){
    // Returns whether button is pressed (true or false)
    // Updates the transmission data (tData)
    // Update the LEDs (on/off)

    tData = 0;
    onLED = 0;

    for (auto iLED=1 ; iLED<=3 ; iLED++){
        if (digitalRead(allocBut[iLED]) == LOW){
            tData = iLED;
            onLED = allocLED[iLED];
            return true;
        }
    }

    return false;
}

void send(){
    //Sends the transmission data (tData)
    //Returns to listening

    // Make sure to send on correct interval
    currentMillis = millis();
    if (currentMillis - previousMillis >= intervalMillis) {
        bool rslt;
        
        // Stop listening
        radio.stopListening();

        // Send tData
        rslt = radio.write( &tData, sizeof(tData) );

        // Listen again
        radio.startListening();

        #ifdef DEBUG
        Serial.print("Data Sent ");
        Serial.print(tData);
        if (rslt) {
            Serial.println("  Acknowledged by other device");
        }
        else {
            Serial.println("  Transmit failed");
        }
        #endif

        previousMillis = millis();
    }
}

void listen(){
    // Listen to signals
    // If signal heard, then update LEDs (on/off)

    if ( radio.available() ) {
        // Update the received data (rData and newData)
        radio.read( &rData, sizeof(rData) );
        newData = true;
    }

    // Update the LEDs
    if (newData){
        onLED = allocLED[rData];
        newData = false;

        #ifdef DEBUG
        Serial.print("Data received ");
        Serial.println(rData);
        #endif
    }
}

void controlLEDs(){
    // Flash the LEDs based on "onLED" variable

    // Turn off all LEDs
    for (auto i=1 ; i<=3 ; i++){
        auto iLED = allocLED[i];
        digitalWrite(iLED, LOW);
        delay(10);
    }
    delay(60);

    // Turn on LED dependent on the "onLED" variable
    if (onLED != 0){
        digitalWrite(onLED, HIGH);
        #ifdef DEBUG
        Serial.print("Turned on LED : ");
        Serial.println(LEDnames[onLED-1]);
        #endif
        delay(400);
    }
}
```
{{< /scrollsection >}}

So what does all this code mean? Well to you it might mean nothing, but to the computer (the compiler) instructions are hidden it the abstract C++ language. Let us briefly go over the meaning of some of these instructions (skip this if your a C++ ninja).

* We first define some variables and constants before `setup` function that will be used later. Also not that everything with a `//` before it is a "comment" and is not read by the computer. I have used these comments to explain the code briefly.
  * `# define DEBUG` is a "preprocessor macro" that can be removed when you are done with testing the code. These will allow us to make some code sections which help us see what is going on during testing.
  * `# define gLED 2` is also a "preprocessor macro", this will replace all the text "gLED" in our code by the number "2". This is done because the green led ("gLED") is on digital pin 2. The same is done for the other LEDs and also for the buttons.
  * `short int onLED` is a "integer variable", this variable will change its value depending on the LED that should be turned on.
  * `const short int allocLED[4]` is an array of "constant integer variables", that contains a handy list of all the LED's pin numbers. It is constant ("const") since it will not be changed later on. The first member of the list ("0") will indicate that none of the LEDs is selected. The same list is made for the buttons.
  * `#ifdef DEBUG`, `const char *LEDnames[4] = { "No led", "Green", "Red", "Yellow" };`, and `#endif` are the first lines of "debug code". It reads: "*if the preprocessor macro "DEBUG" is defined, then do the following: make a constant character pointer array "LEDnames". Now end this if statement.*" These character pointers are just words that will be used to describe the colours that are active (these are the ones you can see in the defined array between the curly brackets).
  * Now we include the libraries that are needed for the communication of the RF-nanos. These are essentially big pieces of code made by someone else that I can hijack with `#include` command. They can be found in the Arduino library section (you can find them when searching [here](https://www.arduino.cc/en/reference/libraries)). 
  * The `#define CE_PIN` and `#define CSN_PIN` are used by the library for the communication. (This is still an artifact of using the use of nRF24L01 libraries for the integrated RF-nano, I do not yet know how to circumvent using these pins. Let me know if you do!)
  * `const byte rAddress[5]` is the virtual address that is given to the RF-nano with this particular C++ code in order to let the other RF-nano know where to send its message to. The `tAddress` is the address that is used to transmit to, it is the address of the recipient (the other RF-nano).
  * As you can see the addresses are the same?! For our Arduino-Phone this does not matter, since the devices will never be sending to their own address. They will always look for another RF-nano with the address. 
  > This means you can upload this same code to both devices!
  * `RF24 radio(CE_PIN, CSN_PIN)` means we are creating an radio object and naming it "RF24". This will be the radio from which we send and receive the messages.
  * The `rData` will contain the data that might be received by this RF-nano. And `tData` will represent the data that needs to be transmitted by this RF-nano, if a button is pressed. These are both integer variables.
  * When receiving a message, we have to check whether the received message is a new message. Therefore, whenever a new message is received: boolean `newData` will jump to the "true" value. When the received message is handled, meaning the LED is turned on: its value will fall back to "false".
  * The `currentMillis`, `previousMillis` and `intervalMillis` are variables that are used for timing the transmissions. Using these we can make sure that the RF-nano will only send a message every `intervalMillis`-number of milliseconds. I have chosen 100ms, since this works out nicely with the delay on the LEDs that is needed for them to transmit smoothly. 
> When you press the devices button for less than 0.1s (=100ms) the device might not register it.

* Then we finally reach the trusted `void setup()` function. This is standard in all arduino codes, and initiates and "sets up" the arduino for operation.
  * In there we have the arduino standard object `Serial` that is used for monitoring and will only be initiated when in the `DEBUG` is defined (which was the very first line). It will post all the `Serial.print` and `Serial.println` contents to the serial monitor on your computer (if connected).
  * `pinMode(gLED, OUTPUT)` and the other two: set the arduino LED-pins to operate as output, since they must power the LEDs.
  * `pinMode(gBut, INPUT_PULLUP)` and its two friends: these pins are set to sense the button presses. They are "always on" and register when the circuit closes (if the button is pressed). For more info see the arduino [documentation page](https://www.arduino.cc/en/Tutorial/Foundations/DigitalPins) (under "Properties of Pins Configured as INPUT_PULLUP")
  * Then `radio.begin()` turns the radio on with a rate of data of 250kB/s `radio.setDataRate( RF24_250KBPS )`, which is the lowest possible value since we don't need to send a lot of data.
  * The message might fail to transmit, therefore `radio.setRetries(3,5)` allows the radio to "re-try" sending the message 5 times (max possible is 15), with an interval of 1000us (=(3 +1)\*250us. The maximum is again 15, which is (15 +1)\*250us = 4000us). See the [RF24 documentation](https://maniacbug.github.io/RF24/classRF24.html#a4c6d3959c8320e64568395f4ef507aef) for more information.
  * `radio.openWritingPipe(tAddress)` opens the possibility for the radio to transmit or "write" to the `tAddress`.
  * `radio.openReadingPipe(1, rAddress)` opens the possibility for the radio to receive or "read" messages on its first pipe from its `rAddress`.
  * The device setup has come to an end, and it is now set up to listen to incoming messages with `radio.startListening()`.
* The `void loop()` function is repeatedly executed by the arduino from now on. It is also standard in almost all arduino scripts.
  * First a boolean `sending` is created, which will indicate whether we need to send a message.
  * The `sending` value is set to "true" if the created `checkPressed()` function (defined later) notices that a button is pressed, otherwise the value is set to "false".
  * If `sending` is "true":
    * If in debug mode, let the serial monitor know that the RF-nano is sending a message.
    * Then send the message by calling the `send()` function (defined later).
  * However, if `sending` is "false":
    * Just keep listening, since there may be an incoming message. This is done using the `listen()` function (defined later).
  * After either transmitting (sending) or receiving/not-receiving (listening) a message the LEDs need to be turned on according to the button pressed or the message received. This is done in the `controlLEDs()` function (defined later).

As you read, there are 4 to-be-defined functions in this device. Let's find out how they work.
* `bool checkPressed()` -
  This function returns a boolean value: "true" if a button is pressed, "false" if not.
  * The transmission data `tData` is reset to 0, and so is the LED-that-must-be-turned-on `onLED`.
  * Then we go through a loop that uses `digitalRead` to sequentially check every button in our `allocBut` list. When one of those is low (here green will have priority over red, which has priority over yellow), this means you are pressing a button. If so:
    * The new transmission data `tData` send will be the index `iLED` of that pressed button. Also the `onLED` variable will be changed to the digital pin responsible for that button's LED, and then the function stops to return "true": a button is being pressed. That is,
  * If not, and the if-statement in the loop returns false every time:
    * This function will continue to return "false": no button is pressed.


* `void send()` -
  This function returns nothing that therefore is of the type `void`.
  * First the current time is recorded in `currentMillis`, here `millis()` (a standard arduino function) changes its value to the amount of milliseconds past since the device was powered.
  * The if-statement following will only be passed when the curent time (`currentMillis`) is at least óne transmission interval later (`intervalMillis`) than the previous time that a transmission was made (`previousMillis`). When "true":
    * A new boolean `rslt` is made (since typing result is too much effort apparently).
    * We briefly interrupt our radio's listening, to write a message which contains the data that is stored on the address-of-our-transmission-data `&tData`, which has a number of bytes equal to the byte-length-of-tData `sizeof(tData)` (what a coincidence right!?). This transmission will return "true" if succesful and "false" if not. The value will be stored in `rslt`. Now we quickly resume listening, in case anything is sent to this RF-nano. If debugging: print some details to the serial monitor about what we have been sending and whether the transmission was successful. At last, we make sure to store the current time we have transmitted as the `previousMillis`, this will make sure that the device will wait a tenth of a second (since `intervalMillis` = 100ms) before it sends again.

* `void listen()` - 
  Also a function that has nothing to give, and is `void` of a returning value.
  * If the radio picks up on something. That is, if it is receiving a message it will:
    * Read that message and put it on the address-of-our-receiving-data `&rData`, which again may contain the corresponding number of bytes.
    * Since it is a new message, it will update `newData` to "true".
  * When this `newData` was actually gathered, we also do:
    * Turn on the LED-pin that has the corresponding index (the index that was received is stored in `rData`). It will downgrade the `newData` to "false" and display the message received on the serial monitor when in debug mode.

* `void controlLEDs()` -
  Function without a return, but does shed some light when appropriate.
  * Lets first create some darkness: the first for-loop turns off all the LED-pins by doing a `digitalWrite(iLED,LOW)` for every element `iLED` in our `allocLED` list. Here we use a short `delay(10)` (10ms) such that the pins are not shut down all at once (this may interfere with the button pins).
  * Then a short period of darkness. A delay of 60ms.
  * Lets now check if we can interupt the darkness. When the `onLED` has a value not equal to 0:
    * Do a `digitalWrite(onLED,HIGH)` to turn on the LED-pin that is needed, show this to the serial monitor, and shine bright for 400ms.

### Wrapping it up

When the lights are responding and you have soldered everything up, then it is time to cover up the mess you have made. Sure, it looks cool and pointy, but pressing a button without grabbing the whole thing is impossible. Let's glue together the carton strips you made all the way in the beginning of this adventure. This carton ensemble is then stuck to the bottom of the buttons, and will support the little force applied when button-pressing. The bottom carton can now be glued on as well, where attention is paid to the alignment of the imprint that was made earlier.

![Sticking with carton](glue_carton_strips.jpeg) ![Wow!](final_device2.jpeg)

### The final product
So what now?

> Well... you need to make another one, otherwise you have nothing to send to.


Let's say you are done, you have got 2 Arduino-Phones. Upload the above code to both devices, and power them using their micro-USB port. Now you are ready to convince someone else to actually use it!

![Look at them go, ready to conquer the world](rs_pair.jpeg)

So how far apart can you go with these things? Well, I have tested the range, and it seems that you can take the communication of the Arduino-Phones are worth approximately 20m, given you have thin walls in-between.

### Extending the range
If you have thick walls or you want to communicate with your neighbour or with your neighbour's neighbour (which is not you), this might be your cue to strengthen the signal. Extending the range can be done with a simple antenna (the reach will be ~1km in open air), but this is something for another post. See you next time!