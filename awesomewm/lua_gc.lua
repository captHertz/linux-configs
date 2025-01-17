-- Lua Garbage Collector

-- {{{ Lua Documentation Reference
-- http://www.lua.org/manual/5.4/manual.html#2.5.1
--
-- In incremental mode, each GC cycle performs a mark-and-sweep collection in
-- small steps interleaved with the program's execution. In this mode, the
-- collector uses three numbers to control its garbage-collection cycles: the
-- garbage-collector pause, the garbage-collector step multiplier, and the
-- garbage-collector step size.
--
-- The garbage-collector pause controls how long the collector waits before
-- starting a new cycle. The collector starts a new cycle when the use of
-- memory hits n% of the use after the previous collection. Larger values make
-- the collector less aggressive. Values equal to or less than 100 mean the
-- collector will not wait to start a new cycle. A value of 200 means that the
-- collector waits for the total memory in use to double before starting a new
-- cycle.
-- The default value is 200; the maximum value is 1000.
--
-- The garbage-collector step multiplier controls the speed of the collector
-- relative to memory allocation, that is, how many elements it marks or sweeps
-- for each kilobyte of memory allocated. Larger values make the collector more
-- aggressive but also increase the size of each incremental step. You should
-- not use values less than 100, because they make the collector too slow and
-- can result in the collector never finishing a cycle.
-- The default value is 100; the maximum value is 1000.
--
-- The garbage-collector step size controls the size of each incremental step,
-- specifically how many bytes the interpreter allocates before performing a
-- step. This parameter is logarithmic: A value of n means the interpreter will
-- allocate 2n bytes between steps and perform equivalent work during the step.
-- A large value (e.g., 60) makes the collector a stop-the-world
-- (non-incremental) collector.
-- The default value is 13, which means steps of approximately 8 Kbytes.
--
-- http://www.lua.org/manual/5.4/manual.html#2.5.2
--
-- In generational mode, the collector does frequent minor collections, which
-- traverses only objects recently created. If after a minor collection the use
-- of memory is still above a limit, the collector does a stop-the-world major
-- collection, which traverses all objects. The generational mode uses two
-- parameters: the minor multiplier and the the major multiplier.
--
-- The minor multiplier controls the frequency of minor collections. For a
-- minor multiplier x, a new minor collection will be done when memory grows x%
-- larger than the memory in use after the previous major collection. For
-- instance, for a multiplier of 20, the collector will do a minor collection
-- when the use of memory gets 20% larger than the use after the previous major
-- collection.
-- The default value is 20; the maximum value is 200.
--
-- The major multiplier controls the frequency of major collections. For a
-- major multiplier x, a new major collection will be done when memory grows x%
-- larger than the memory in use after the previous major collection. For
-- instance, for a multiplier of 100, the collector will do a major collection
-- when the use of memory gets larger than twice the use after the previous
-- collection.
-- The default value is 100; the maximum value is 1000.
--
-- https://www.lua.org/manual/5.4/manual.html#pdf-collectgarbage
--
-- "collect"     : Performs a full garbage-collection cycle. This is the
--                 default option.
-- "stop"        : Stops automatic execution of the garbage collector. The
--                 collector will run only when explicitly invoked, until a
--                 call to restart it.
-- "restart"     : Restarts automatic execution of the garbage collector.
-- "count"       : Returns the total memory in use by Lua in Kbytes. The value
--                 has a fractional part, so that it multiplied by 1024 gives
--                 the exact number of bytes in use by Lua.
-- "step"        : Performs a garbage-collection step. The step "size" is
--                 controlled by arg. With a zero value, the collector will
--                 perform one basic (indivisible) step. For non-zero values,
--                 the collector will perform as if that amount of memory (in
--                 Kbytes) had been allocated by Lua. Returns true if the step
--                 finished a collection cycle.
-- "isrunning"   : Returns a boolean that tells whether the collector is
--                 running (i.e., not stopped).
-- "incremental" : Change the collector mode to incremental. This option can be
--                 followed by three numbers: the garbage-collector pause, the
--                 step multiplier, and the step size (see §2.5.1). A zero
--                 means to not change that value.
-- "generational": Change the collector mode to generational. This option can
--                 be followed by two numbers: the garbage-collector minor
--                 multiplier and the major multiplier (see §2.5.2). A zero
--                 means to not change that value.
--
-- https://www.lua.org/manual/5.4/manual.html#8.2
-- The options "setpause" and "setstepmul" of the function collectgarbage are deprecated.
-- You should use the new option "incremental" to set them.
-- }}}

collectgarbage("collect")
collectgarbage("incremental", 125, 500, 0)
