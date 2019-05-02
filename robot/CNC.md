---
geometry: margin=2cm
---

## CNC
\hfill{Sasha Hydrie}

#### Controls

Notably, hovering over any button on the control screen will provide a quick description of its function.
Acccuracy is about 1/1000 of an inch. 

Axes:

* Positive *x*-axis is lateral, if facing the front of the machine positive is to the right.
* Positive *y*-axis is inwards, towards the machine if facing it.
* positive *z*-axis is upwards. 

Controls:

* Work coordinate buttons set current to 0.
* **Go to G30** moves the mill out of the way, for tool change or clearance.

#### Setup

Measuring Tools:

* Method 1: Manual calibration

Measure using the precision height gauge, too much force and it will lift itself. Distance is measured from base that touches machine, not full length. Notably, the highest numbers visible are the value, not necessarily the most level ones. 

* Method 2: "Automatic", machine calibration

Change tool number to 0, via the **T** field. Bring spindle down to work surface, without the tool in place. Put a piece of paper on the bed, and continue lowering the spindle until moving the paper has friction. Set Z to the thickness of the paper. Repeat paper friction process with tool in place, notably the tool number needs to be changed. *Voila*, length of tool, is the difference in Z values. 

Startup: 

1. Make sure the intended tool is in place
2. First turn on the power strip.
3. Turn power dial, green circle is stop yellow strip is on
4. Release E-stop, red dial on front
5. **Reset** in Path Pilot, then hit each Ref button *Ref Z*, *Ref Y*, *Ref X*. Do Z first to prevent clearance issues!
    * Can set to step if accuracy is needed, of varying sizes
6. To control starting position; arrow keys to control bed and pageup/down to control the tool.


#### Hardware

Tool is changed by pressing the black button to release, then pressing again when switching.

#### Software

Make sure computer is running path pilot prior to turning on the mill.

