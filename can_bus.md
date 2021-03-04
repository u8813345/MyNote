# Classical CAN vs. CAN FD Protocols

The primary difference between the classical CAN and CAN FD is the Flexible Data (FD). 

Using CAN FD, Electronic Control Unit (ECU)s can `dynamically switch` to different `data-rat`e and with larger or smaller `message sizes`. 

Enhanced features in CAN FD includes the capability to dynamically select and switch to faster or slower data rate, as and when required, 
and to pack more data within the same CAN frame / message and transport it over the CAN BUS / network in less time. Faster data speed and more data capacity enhancements results in several system operational advantages compared to the classic CAN. Using CAN FD, sensor and control data can be sent and received by the ECU (Electronic Control Unit) software much quicker. Commands issued by the executing ECU software reaches the output controller much faster. CAN FD is typically used in high performance ECUs of modern vehicles. A modern vehicle can have more than 70 ECUs that use CAN FD to exchange information over the CAN Bus when the engine is running or when the vehicle is moving.

In CAN FD, 
  the frame/message ID uses the `29-bits format` used in the Extended ID version of classic CAN (Standard ID is 11 bits long). 
  The message payload size has been increased to 64 bytes of data in each CAN-frame / message, compared to only 8-bytes in the classic CAN frame. 
  CAN FD can handle CAN frames/messages with 11-bit ID as well. 
  A frame is a message transmitted as a sequence of binary bit-pattern. 
  In CAN FD, the data rate is increased to be 5 times faster than the classic CAN 
     (5Mbit/s for the data payload only, the arbitration bit rate is still limited to 1Mbit/s for compatibility). 
  CAN FD protocol specification includes some other enhancements as well, such as better detection of errors in the received CAN message and the executing software flexibility to dynamically select (from a list) and switch to faster or slower data rate transfer, as and when required. On the CAN FD BUS, some sensors may operate at slower data rate while others at faster data rate. CAN BUS is a shared pair of wires onto which electronic sensors, controller units and ECUs are connected. CAN Bus is used for exchanging information between operational units periodically or on demand. The electrical condition and configuration of the CAN Bus, i.e. the total number of units connected, the length of the CAN Bus wires and other electro-magnetic factors determines the fastest data transfer rate possible on that CAN Bus. The CAN protocol (and by extension CAN FD) has an excellent collision resolution mechanism that depends on the propagation time of the signal and the network configuration (ring, bus or star), and to a lesser extent the number of units on the bus. Therefore a physically long network may limit the data rate below the theoretical maximum.






# MCP2515
* 好像不支援 CAN FD
* https://www.electronicshub.org/arduino-mcp2515-can-bus-tutorial/
* https://circuitdigest.com/microcontroller-projects/arduino-can-tutorial-interfacing-mcp2515-can-bus-module-with-arduino

# TCAN4550
* TCAN4550EVM is powered by a DC 12V through J8(->VSUP)
* VIO SELECT(S1) is chosen to be in 3.3V output.
* TCAN4550EVM <-> 開發板 接 SPI2 cs0
 * 開發板 CS0 上面 已經有 flash, 所以只能 接 CS1
 * J137 (SPICSA#)  1<->2    =>  15<->16
 * J133 (SPICKA)   1<->2    =>  5<->6
 * J134 (SPIMOSIA) 1<->2    =>  5<->6
 * J135 (SPIMISOA) 1<->2    =>  5<->6
* GPIOX6 <-> nINT
* GPIOG6 <-> RST (reset)
* https://developer.ridgerun.com/wiki/index.php/How_to_configure_and_use_CAN_bus
* [device tree bonding for tcan4x5x](https://www.kernel.org/doc/Documentation/devicetree/bindings/net/can/tcan4x5x.txt) 
