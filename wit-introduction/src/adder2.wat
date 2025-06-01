(module
  (type (;0;) (func (param i32 i32) (result i32)))
  (type (;1;) (func (param i32 i32 i32) (result i32)))
  (type (;2;) (func (param i32 i32 i32 i32) (result i32)))
  (type (;3;) (func (param i32) (result i32)))
  (type (;4;) (func (param i32)))
  (type (;5;) (func (param i32 i32 i32 i64 i32) (result i32)))
  (type (;6;) (func (param i32 i32 i32 i32 i32) (result i32)))
  (type (;7;) (func (param i32 i64 i64 i32) (result i32)))
  (type (;8;) (func (param i32 i64 i64) (result i32)))
  (type (;9;) (func (param i32 i32 i32 i32 i32 i32) (result i32)))
  (type (;10;) (func (param i32 i32)))
  (type (;11;) (func (param i32 i32 i32)))
  (type (;12;) (func (param i32 i64 i32) (result i32)))
  (type (;13;) (func (param i32 i64) (result i32)))
  (type (;14;) (func (param i32 i64 i32 i32) (result i32)))
  (type (;15;) (func (result i32)))
  (type (;16;) (func))
  (type (;17;) (func (param i32 i32 i32 i32 i64 i64 i32) (result i32)))
  (type (;18;) (func (param i32 i32 i32 i32 i32 i32 i32) (result i32)))
  (type (;19;) (func (param i32 i32 i32 i32 i32 i64 i64 i32 i32) (result i32)))
  (type (;20;) (func (param f32 f32) (result f32)))
  (type (;21;) (func (param f64 f64) (result f64)))
  (type (;22;) (func (param i32 i32 i32 i64 i64 i32) (result i32)))
  (type (;23;) (func (param i32 i32 i32 i32 i64 i64 i32 i32) (result i32)))
  (import "wasi_snapshot_preview1" "args_get" (func (;0;) (type 0)))
  (import "wasi_snapshot_preview1" "args_sizes_get" (func (;1;) (type 0)))
  (import "wasi_snapshot_preview1" "environ_get" (func (;2;) (type 0)))
  (import "wasi_snapshot_preview1" "environ_sizes_get" (func (;3;) (type 0)))
  (import "wasi_snapshot_preview1" "clock_res_get" (func (;4;) (type 0)))
  (import "wasi_snapshot_preview1" "clock_time_get" (func (;5;) (type 12)))
  (import "wasi_snapshot_preview1" "fd_advise" (func (;6;) (type 7)))
  (import "wasi_snapshot_preview1" "fd_allocate" (func (;7;) (type 8)))
  (import "wasi_snapshot_preview1" "fd_close" (func (;8;) (type 3)))
  (import "wasi_snapshot_preview1" "fd_datasync" (func (;9;) (type 3)))
  (import "wasi_snapshot_preview1" "fd_fdstat_get" (func (;10;) (type 0)))
  (import "wasi_snapshot_preview1" "fd_fdstat_set_flags" (func (;11;) (type 0)))
  (import "wasi_snapshot_preview1" "fd_fdstat_set_rights" (func (;12;) (type 8)))
  (import "wasi_snapshot_preview1" "fd_filestat_get" (func (;13;) (type 0)))
  (import "wasi_snapshot_preview1" "fd_filestat_set_size" (func (;14;) (type 13)))
  (import "wasi_snapshot_preview1" "fd_filestat_set_times" (func (;15;) (type 7)))
  (import "wasi_snapshot_preview1" "fd_pread" (func (;16;) (type 5)))
  (import "wasi_snapshot_preview1" "fd_prestat_get" (func (;17;) (type 0)))
  (import "wasi_snapshot_preview1" "fd_prestat_dir_name" (func (;18;) (type 1)))
  (import "wasi_snapshot_preview1" "fd_pwrite" (func (;19;) (type 5)))
  (import "wasi_snapshot_preview1" "fd_read" (func (;20;) (type 2)))
  (import "wasi_snapshot_preview1" "fd_readdir" (func (;21;) (type 5)))
  (import "wasi_snapshot_preview1" "fd_renumber" (func (;22;) (type 0)))
  (import "wasi_snapshot_preview1" "fd_seek" (func (;23;) (type 14)))
  (import "wasi_snapshot_preview1" "fd_sync" (func (;24;) (type 3)))
  (import "wasi_snapshot_preview1" "fd_tell" (func (;25;) (type 0)))
  (import "wasi_snapshot_preview1" "fd_write" (func (;26;) (type 2)))
  (import "wasi_snapshot_preview1" "path_create_directory" (func (;27;) (type 1)))
  (import "wasi_snapshot_preview1" "path_filestat_get" (func (;28;) (type 6)))
  (import "wasi_snapshot_preview1" "path_filestat_set_times" (func (;29;) (type 17)))
  (import "wasi_snapshot_preview1" "path_link" (func (;30;) (type 18)))
  (import "wasi_snapshot_preview1" "path_open" (func (;31;) (type 19)))
  (import "wasi_snapshot_preview1" "path_readlink" (func (;32;) (type 9)))
  (import "wasi_snapshot_preview1" "path_remove_directory" (func (;33;) (type 1)))
  (import "wasi_snapshot_preview1" "path_rename" (func (;34;) (type 9)))
  (import "wasi_snapshot_preview1" "path_symlink" (func (;35;) (type 6)))
  (import "wasi_snapshot_preview1" "path_unlink_file" (func (;36;) (type 1)))
  (import "wasi_snapshot_preview1" "poll_oneoff" (func (;37;) (type 2)))
  (import "wasi_snapshot_preview1" "proc_exit" (func (;38;) (type 4)))
  (import "wasi_snapshot_preview1" "sched_yield" (func (;39;) (type 15)))
  (import "wasi_snapshot_preview1" "random_get" (func (;40;) (type 0)))
  (import "wasi_snapshot_preview1" "sock_accept" (func (;41;) (type 1)))
  (import "wasi_snapshot_preview1" "sock_recv" (func (;42;) (type 9)))
  (import "wasi_snapshot_preview1" "sock_send" (func (;43;) (type 6)))
  (import "wasi_snapshot_preview1" "sock_shutdown" (func (;44;) (type 0)))
  (func (;45;) (type 16)
    nop)
  (func (;46;) (type 4) (param i32)
    local.get 0
    i32.load offset=4
    if  ;; label = @1
      local.get 0
      i32.load
      call 67
    end)
  (func (;47;) (type 2) (param i32 i32 i32 i32) (result i32)
    block  ;; label = @1
      local.get 3
      i32.eqz
      br_if 0 (;@1;)
      local.get 0
      local.get 3
      call 69
      local.tee 2
      br_if 0 (;@1;)
      unreachable
    end
    local.get 2)
  (func (;48;) (type 10) (param i32 i32)
    local.get 0
    local.get 1
    i32.store
    local.get 0
    local.get 1
    call 79
    i32.store offset=4)
  (func (;49;) (type 10) (param i32 i32)
    (local i32)
    local.get 0
    local.get 1
    call 79
    local.tee 2
    i32.store offset=4
    local.get 0
    i32.const 0
    i32.const 0
    i32.const 1
    local.get 2
    call 47
    local.tee 2
    i32.store
    local.get 2
    local.get 1
    local.get 0
    i32.load offset=4
    call 77
    drop)
  (func (;50;) (type 4) (param i32)
    local.get 0
    i32.load offset=4
    if  ;; label = @1
      local.get 0
      i32.load
      call 67
    end
    local.get 0
    i64.const 0
    i64.store align=4)
  (func (;51;) (type 0) (param i32 i32) (result i32)
    local.get 0
    local.get 1
    i32.add)
  (func (;52;) (type 20) (param f32 f32) (result f32)
    local.get 0
    local.get 1
    f32.add)
  (func (;53;) (type 21) (param f64 f64) (result f64)
    local.get 0
    local.get 1
    f64.add)
  (func (;54;) (type 2) (param i32 i32 i32 i32) (result i32)
    (local i32)
    global.get 0
    i32.const 32
    i32.sub
    local.tee 4
    global.set 0
    local.get 4
    local.get 1
    i32.store offset=28
    local.get 4
    local.get 0
    i32.store offset=24
    local.get 4
    local.get 3
    i32.store offset=20
    local.get 4
    local.get 2
    i32.store offset=16
    local.get 4
    i32.const 24
    i32.add
    local.get 4
    i32.const 16
    i32.add
    local.get 4
    i32.const 8
    i32.add
    call 59
    i32.const 1024
    local.get 4
    i64.load offset=8 align=4
    i64.store align=4
    local.get 4
    i32.const 32
    i32.add
    global.set 0
    i32.const 1024)
  (func (;55;) (type 0) (param i32 i32) (result i32)
    (local i32)
    global.get 0
    i32.const 16
    i32.sub
    local.tee 2
    global.set 0
    local.get 2
    local.get 1
    i32.store offset=12
    local.get 2
    local.get 0
    i32.store offset=8
    local.get 2
    i32.const 8
    i32.add
    local.get 2
    call 60
    i32.const 1024
    local.get 2
    i64.load align=4
    i64.store align=4
    local.get 2
    i32.const 16
    i32.add
    global.set 0
    i32.const 1024)
  (func (;56;) (type 2) (param i32 i32 i32 i32) (result i32)
    (local i32)
    global.get 0
    i32.const 32
    i32.sub
    local.tee 4
    global.set 0
    local.get 4
    local.get 1
    i32.store offset=28
    local.get 4
    local.get 0
    i32.store offset=24
    local.get 4
    local.get 3
    i32.store offset=20
    local.get 4
    local.get 2
    i32.store offset=16
    local.get 4
    i32.const 8
    i32.add
    local.tee 0
    local.get 4
    i32.const 16
    i32.add
    local.tee 1
    i32.load
    local.get 4
    i32.const 24
    i32.add
    local.tee 2
    i32.load
    i32.add
    i32.store
    local.get 0
    local.get 1
    i32.load offset=4
    local.get 2
    i32.load offset=4
    i32.add
    i32.store offset=4
    i32.const 1024
    local.get 4
    i64.load offset=8 align=4
    i64.store align=4
    local.get 4
    i32.const 32
    i32.add
    global.set 0
    i32.const 1024)
  (func (;57;) (type 2) (param i32 i32 i32 i32) (result i32)
    (local i32)
    global.get 0
    i32.const 32
    i32.sub
    local.tee 4
    global.set 0
    local.get 4
    local.get 1
    i32.store offset=28
    local.get 4
    local.get 0
    i32.store offset=24
    local.get 4
    local.get 3
    i32.store offset=20
    local.get 4
    local.get 2
    i32.store offset=16
    local.get 4
    i32.const 8
    i32.add
    local.tee 0
    local.get 4
    i32.const 24
    i32.add
    local.tee 1
    i32.load
    local.get 4
    i32.const 16
    i32.add
    local.tee 2
    i32.load
    i32.sub
    i32.store
    local.get 0
    local.get 1
    i32.load offset=4
    local.get 2
    i32.load offset=4
    i32.sub
    i32.store offset=4
    i32.const 1024
    local.get 4
    i64.load offset=8 align=4
    i64.store align=4
    local.get 4
    i32.const 32
    i32.add
    global.set 0
    i32.const 1024)
  (func (;58;) (type 1) (param i32 i32 i32) (result i32)
    (local i32)
    global.get 0
    i32.const 16
    i32.sub
    local.tee 3
    global.set 0
    local.get 3
    local.get 1
    i32.store offset=12
    local.get 3
    local.get 0
    i32.store offset=8
    local.get 3
    i32.const 8
    i32.add
    local.get 2
    local.get 3
    call 63
    i32.const 1024
    local.get 3
    i64.load align=4
    i64.store align=4
    local.get 3
    i32.const 16
    i32.add
    global.set 0
    i32.const 1024)
  (func (;59;) (type 11) (param i32 i32 i32)
    (local i32 i32 i32 i32)
    block  ;; label = @1
      local.get 1
      i32.load offset=4
      local.tee 6
      local.get 0
      i32.load offset=4
      local.tee 3
      i32.add
      local.tee 4
      call 65
      local.tee 5
      i32.eqz
      if  ;; label = @2
        i32.const 0
        local.set 4
        br 1 (;@1;)
      end
      local.get 5
      local.get 0
      i32.load
      local.get 3
      call 77
      local.get 3
      i32.add
      local.get 1
      i32.load
      local.get 6
      call 77
      drop
    end
    local.get 2
    local.get 4
    i32.store offset=4
    local.get 2
    local.get 5
    i32.store)
  (func (;60;) (type 10) (param i32 i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32)
    block  ;; label = @1
      local.get 0
      i32.load offset=4
      local.tee 2
      call 65
      local.tee 4
      i32.eqz
      if  ;; label = @2
        i32.const 0
        local.set 4
        i32.const 0
        local.set 2
        br 1 (;@1;)
      end
      local.get 2
      i32.eqz
      br_if 0 (;@1;)
      local.get 2
      i32.const 3
      i32.and
      local.set 5
      local.get 0
      i32.load
      local.set 8
      i32.const 0
      local.set 0
      local.get 2
      i32.const 4
      i32.ge_u
      if  ;; label = @2
        local.get 2
        i32.const -4
        i32.and
        local.set 9
        local.get 2
        local.get 8
        i32.add
        local.tee 3
        i32.const 1
        i32.sub
        local.set 6
        loop  ;; label = @3
          local.get 0
          local.get 4
          i32.add
          local.tee 7
          local.get 6
          i32.load8_u
          i32.store8
          local.get 7
          i32.const 1
          i32.add
          local.get 3
          local.get 0
          i32.const -2
          i32.xor
          i32.add
          i32.load8_u
          i32.store8
          local.get 7
          i32.const 2
          i32.add
          local.get 3
          local.get 0
          i32.const -3
          i32.xor
          i32.add
          i32.load8_u
          i32.store8
          local.get 7
          i32.const 3
          i32.add
          local.get 3
          local.get 0
          i32.const -4
          i32.xor
          i32.add
          i32.load8_u
          i32.store8
          local.get 6
          i32.const 4
          i32.sub
          local.set 6
          local.get 9
          local.get 0
          i32.const 4
          i32.add
          local.tee 0
          i32.ne
          br_if 0 (;@3;)
        end
      end
      local.get 5
      i32.eqz
      br_if 0 (;@1;)
      local.get 0
      local.get 4
      i32.add
      local.set 3
      local.get 8
      local.get 0
      i32.const -1
      i32.xor
      local.get 2
      i32.add
      i32.add
      local.set 0
      loop  ;; label = @2
        local.get 3
        local.get 0
        i32.load8_u
        i32.store8
        local.get 0
        i32.const 1
        i32.sub
        local.set 0
        local.get 3
        i32.const 1
        i32.add
        local.set 3
        local.get 5
        i32.const 1
        i32.sub
        local.tee 5
        br_if 0 (;@2;)
      end
    end
    local.get 1
    local.get 2
    i32.store offset=4
    local.get 1
    local.get 4
    i32.store)
  (func (;61;) (type 11) (param i32 i32 i32)
    local.get 2
    local.get 1
    i32.load
    local.get 0
    i32.load
    i32.add
    i32.store
    local.get 2
    local.get 1
    i32.load offset=4
    local.get 0
    i32.load offset=4
    i32.add
    i32.store offset=4)
  (func (;62;) (type 11) (param i32 i32 i32)
    local.get 2
    local.get 0
    i32.load
    local.get 1
    i32.load
    i32.sub
    i32.store
    local.get 2
    local.get 0
    i32.load offset=4
    local.get 1
    i32.load offset=4
    i32.sub
    i32.store offset=4)
  (func (;63;) (type 11) (param i32 i32 i32)
    (local i32 i32 i32 i32 i32 i32)
    local.get 2
    local.get 0
    i32.load offset=4
    local.tee 3
    i32.const 3
    i32.shl
    call 65
    local.tee 4
    i32.store
    local.get 4
    i32.eqz
    if  ;; label = @1
      local.get 2
      i32.const 0
      i32.store offset=4
      return
    end
    local.get 2
    local.get 3
    i32.store offset=4
    block  ;; label = @1
      local.get 3
      i32.eqz
      br_if 0 (;@1;)
      local.get 0
      i32.load
      local.set 7
      i32.const 0
      local.set 0
      local.get 3
      i32.const 1
      i32.ne
      if  ;; label = @2
        local.get 3
        i32.const -2
        i32.and
        local.set 8
        i32.const 0
        local.set 2
        loop  ;; label = @3
          local.get 2
          local.get 4
          i32.add
          local.tee 5
          local.get 2
          local.get 7
          i32.add
          local.tee 6
          i32.load
          local.get 1
          i32.mul
          i32.store
          local.get 5
          i32.const 4
          i32.add
          local.get 6
          i32.const 4
          i32.add
          i32.load
          local.get 1
          i32.mul
          i32.store
          local.get 5
          i32.const 8
          i32.add
          local.get 6
          i32.const 8
          i32.add
          i32.load
          local.get 1
          i32.mul
          i32.store
          local.get 5
          i32.const 12
          i32.add
          local.get 6
          i32.const 12
          i32.add
          i32.load
          local.get 1
          i32.mul
          i32.store
          local.get 2
          i32.const 16
          i32.add
          local.set 2
          local.get 8
          local.get 0
          i32.const 2
          i32.add
          local.tee 0
          i32.ne
          br_if 0 (;@3;)
        end
      end
      local.get 3
      i32.const 1
      i32.and
      i32.eqz
      br_if 0 (;@1;)
      local.get 4
      local.get 0
      i32.const 3
      i32.shl
      local.tee 0
      i32.add
      local.tee 2
      local.get 0
      local.get 7
      i32.add
      local.tee 0
      i32.load
      local.get 1
      i32.mul
      i32.store
      local.get 2
      local.get 0
      i32.load offset=4
      local.get 1
      i32.mul
      i32.store offset=4
    end)
  (func (;64;) (type 3) (param i32) (result i32)
    local.get 0
    call 65)
  (func (;65;) (type 3) (param i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get 0
    i32.const 16
    i32.sub
    local.tee 10
    global.set 0
    i32.const 1056
    i32.load
    local.tee 7
    i32.eqz
    if  ;; label = @1
      i32.const 1504
      i32.load
      local.tee 3
      i32.eqz
      if  ;; label = @2
        i32.const 1516
        i64.const -1
        i64.store align=4
        i32.const 1508
        i64.const 281474976776192
        i64.store align=4
        i32.const 1504
        local.get 10
        i32.const 8
        i32.add
        i32.const -16
        i32.and
        i32.const 1431655768
        i32.xor
        local.tee 3
        i32.store
        i32.const 1524
        i32.const 0
        i32.store
        i32.const 1476
        i32.const 0
        i32.store
      end
      i32.const 1480
      i32.const 67072
      i32.store
      i32.const 1048
      i32.const 67072
      i32.store
      i32.const 1068
      local.get 3
      i32.store
      i32.const 1064
      i32.const -1
      i32.store
      i32.const 1484
      i32.const 64000
      i32.store
      i32.const 1468
      i32.const 64000
      i32.store
      i32.const 1464
      i32.const 64000
      i32.store
      loop  ;; label = @2
        local.get 1
        i32.const 1092
        i32.add
        local.get 1
        i32.const 1080
        i32.add
        local.tee 2
        i32.store
        local.get 2
        local.get 1
        i32.const 1072
        i32.add
        local.tee 5
        i32.store
        local.get 1
        i32.const 1084
        i32.add
        local.get 5
        i32.store
        local.get 1
        i32.const 1100
        i32.add
        local.get 1
        i32.const 1088
        i32.add
        local.tee 5
        i32.store
        local.get 5
        local.get 2
        i32.store
        local.get 1
        i32.const 1108
        i32.add
        local.get 1
        i32.const 1096
        i32.add
        local.tee 2
        i32.store
        local.get 2
        local.get 5
        i32.store
        local.get 1
        i32.const 1104
        i32.add
        local.get 2
        i32.store
        local.get 1
        i32.const 32
        i32.add
        local.tee 1
        i32.const 256
        i32.ne
        br_if 0 (;@2;)
      end
      i32.const 131020
      i32.const 56
      i32.store
      i32.const 1060
      i32.const 1520
      i32.load
      i32.store
      i32.const 1056
      i32.const 67080
      local.tee 7
      i32.store
      i32.const 1044
      i32.const 63936
      i32.store
      i32.const 67084
      i32.const 63937
      i32.store
    end
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              block  ;; label = @6
                block  ;; label = @7
                  block  ;; label = @8
                    block  ;; label = @9
                      block  ;; label = @10
                        block  ;; label = @11
                          block  ;; label = @12
                            local.get 0
                            i32.const 236
                            i32.le_u
                            if  ;; label = @13
                              i32.const 1032
                              i32.load
                              local.tee 4
                              i32.const 16
                              local.get 0
                              i32.const 19
                              i32.add
                              i32.const 496
                              i32.and
                              local.get 0
                              i32.const 11
                              i32.lt_u
                              select
                              local.tee 6
                              i32.const 3
                              i32.shr_u
                              local.tee 0
                              i32.shr_u
                              local.tee 1
                              i32.const 3
                              i32.and
                              if  ;; label = @14
                                block  ;; label = @15
                                  local.get 1
                                  i32.const 1
                                  i32.and
                                  local.get 0
                                  i32.or
                                  i32.const 1
                                  i32.xor
                                  local.tee 2
                                  i32.const 3
                                  i32.shl
                                  local.tee 0
                                  i32.const 1072
                                  i32.add
                                  local.tee 1
                                  local.get 0
                                  i32.const 1080
                                  i32.add
                                  i32.load
                                  local.tee 0
                                  i32.load offset=8
                                  local.tee 5
                                  i32.eq
                                  if  ;; label = @16
                                    i32.const 1032
                                    local.get 4
                                    i32.const -2
                                    local.get 2
                                    i32.rotl
                                    i32.and
                                    i32.store
                                    br 1 (;@15;)
                                  end
                                  local.get 1
                                  local.get 5
                                  i32.store offset=8
                                  local.get 5
                                  local.get 1
                                  i32.store offset=12
                                end
                                local.get 0
                                i32.const 8
                                i32.add
                                local.set 1
                                local.get 0
                                local.get 2
                                i32.const 3
                                i32.shl
                                local.tee 2
                                i32.const 3
                                i32.or
                                i32.store offset=4
                                local.get 0
                                local.get 2
                                i32.add
                                local.tee 0
                                local.get 0
                                i32.load offset=4
                                i32.const 1
                                i32.or
                                i32.store offset=4
                                br 13 (;@1;)
                              end
                              local.get 6
                              i32.const 1040
                              i32.load
                              local.tee 8
                              i32.le_u
                              br_if 1 (;@12;)
                              local.get 1
                              if  ;; label = @14
                                block  ;; label = @15
                                  i32.const 2
                                  local.get 0
                                  i32.shl
                                  local.tee 2
                                  i32.const 0
                                  local.get 2
                                  i32.sub
                                  i32.or
                                  local.get 1
                                  local.get 0
                                  i32.shl
                                  i32.and
                                  i32.ctz
                                  local.tee 1
                                  i32.const 3
                                  i32.shl
                                  local.tee 0
                                  i32.const 1072
                                  i32.add
                                  local.tee 2
                                  local.get 0
                                  i32.const 1080
                                  i32.add
                                  i32.load
                                  local.tee 0
                                  i32.load offset=8
                                  local.tee 5
                                  i32.eq
                                  if  ;; label = @16
                                    i32.const 1032
                                    local.get 4
                                    i32.const -2
                                    local.get 1
                                    i32.rotl
                                    i32.and
                                    local.tee 4
                                    i32.store
                                    br 1 (;@15;)
                                  end
                                  local.get 2
                                  local.get 5
                                  i32.store offset=8
                                  local.get 5
                                  local.get 2
                                  i32.store offset=12
                                end
                                local.get 0
                                local.get 6
                                i32.const 3
                                i32.or
                                i32.store offset=4
                                local.get 0
                                local.get 1
                                i32.const 3
                                i32.shl
                                local.tee 1
                                i32.add
                                local.get 1
                                local.get 6
                                i32.sub
                                local.tee 5
                                i32.store
                                local.get 0
                                local.get 6
                                i32.add
                                local.tee 3
                                local.get 5
                                i32.const 1
                                i32.or
                                i32.store offset=4
                                local.get 8
                                if  ;; label = @15
                                  local.get 8
                                  i32.const -8
                                  i32.and
                                  i32.const 1072
                                  i32.add
                                  local.set 1
                                  i32.const 1052
                                  i32.load
                                  local.set 2
                                  block (result i32)  ;; label = @16
                                    local.get 4
                                    i32.const 1
                                    local.get 8
                                    i32.const 3
                                    i32.shr_u
                                    i32.shl
                                    local.tee 7
                                    i32.and
                                    i32.eqz
                                    if  ;; label = @17
                                      i32.const 1032
                                      local.get 4
                                      local.get 7
                                      i32.or
                                      i32.store
                                      local.get 1
                                      br 1 (;@16;)
                                    end
                                    local.get 1
                                    i32.load offset=8
                                  end
                                  local.tee 4
                                  local.get 2
                                  i32.store offset=12
                                  local.get 1
                                  local.get 2
                                  i32.store offset=8
                                  local.get 2
                                  local.get 1
                                  i32.store offset=12
                                  local.get 2
                                  local.get 4
                                  i32.store offset=8
                                end
                                local.get 0
                                i32.const 8
                                i32.add
                                local.set 1
                                i32.const 1052
                                local.get 3
                                i32.store
                                i32.const 1040
                                local.get 5
                                i32.store
                                br 13 (;@1;)
                              end
                              i32.const 1036
                              i32.load
                              local.tee 11
                              i32.eqz
                              br_if 1 (;@12;)
                              local.get 11
                              i32.ctz
                              i32.const 2
                              i32.shl
                              i32.const 1336
                              i32.add
                              i32.load
                              local.tee 2
                              i32.load offset=4
                              i32.const -8
                              i32.and
                              local.get 6
                              i32.sub
                              local.set 3
                              local.get 2
                              local.set 0
                              loop  ;; label = @14
                                block  ;; label = @15
                                  local.get 0
                                  i32.load offset=16
                                  local.tee 1
                                  i32.eqz
                                  if  ;; label = @16
                                    local.get 0
                                    i32.load offset=20
                                    local.tee 1
                                    i32.eqz
                                    br_if 1 (;@15;)
                                  end
                                  local.get 1
                                  i32.load offset=4
                                  i32.const -8
                                  i32.and
                                  local.get 6
                                  i32.sub
                                  local.tee 0
                                  local.get 3
                                  local.get 0
                                  local.get 3
                                  i32.lt_u
                                  local.tee 0
                                  select
                                  local.set 3
                                  local.get 1
                                  local.get 2
                                  local.get 0
                                  select
                                  local.set 2
                                  local.get 1
                                  local.set 0
                                  br 1 (;@14;)
                                end
                              end
                              local.get 2
                              i32.load offset=24
                              local.set 9
                              local.get 2
                              local.get 2
                              i32.load offset=12
                              local.tee 1
                              i32.ne
                              if  ;; label = @14
                                local.get 2
                                i32.load offset=8
                                local.tee 0
                                local.get 1
                                i32.store offset=12
                                local.get 1
                                local.get 0
                                i32.store offset=8
                                br 12 (;@2;)
                              end
                              local.get 2
                              i32.load offset=20
                              local.tee 0
                              if (result i32)  ;; label = @14
                                local.get 2
                                i32.const 20
                                i32.add
                              else
                                local.get 2
                                i32.load offset=16
                                local.tee 0
                                i32.eqz
                                br_if 3 (;@11;)
                                local.get 2
                                i32.const 16
                                i32.add
                              end
                              local.set 5
                              loop  ;; label = @14
                                local.get 5
                                local.set 7
                                local.get 0
                                local.tee 1
                                i32.const 20
                                i32.add
                                local.set 5
                                local.get 1
                                i32.load offset=20
                                local.tee 0
                                br_if 0 (;@14;)
                                local.get 1
                                i32.const 16
                                i32.add
                                local.set 5
                                local.get 1
                                i32.load offset=16
                                local.tee 0
                                br_if 0 (;@14;)
                              end
                              local.get 7
                              i32.const 0
                              i32.store
                              br 11 (;@2;)
                            end
                            i32.const -1
                            local.set 6
                            local.get 0
                            i32.const -65
                            i32.gt_u
                            br_if 0 (;@12;)
                            local.get 0
                            i32.const 19
                            i32.add
                            local.tee 1
                            i32.const -16
                            i32.and
                            local.set 6
                            i32.const 1036
                            i32.load
                            local.tee 8
                            i32.eqz
                            br_if 0 (;@12;)
                            i32.const 31
                            local.set 9
                            i32.const 0
                            local.get 6
                            i32.sub
                            local.set 3
                            local.get 0
                            i32.const 16777196
                            i32.le_u
                            if  ;; label = @13
                              local.get 6
                              i32.const 38
                              local.get 1
                              i32.const 8
                              i32.shr_u
                              i32.clz
                              local.tee 0
                              i32.sub
                              i32.shr_u
                              i32.const 1
                              i32.and
                              local.get 0
                              i32.const 1
                              i32.shl
                              i32.sub
                              i32.const 62
                              i32.add
                              local.set 9
                            end
                            block  ;; label = @13
                              block  ;; label = @14
                                block  ;; label = @15
                                  local.get 9
                                  i32.const 2
                                  i32.shl
                                  i32.const 1336
                                  i32.add
                                  i32.load
                                  local.tee 0
                                  i32.eqz
                                  if  ;; label = @16
                                    i32.const 0
                                    local.set 1
                                    i32.const 0
                                    local.set 5
                                    br 1 (;@15;)
                                  end
                                  i32.const 0
                                  local.set 1
                                  local.get 6
                                  i32.const 0
                                  i32.const 25
                                  local.get 9
                                  i32.const 1
                                  i32.shr_u
                                  i32.sub
                                  local.get 9
                                  i32.const 31
                                  i32.eq
                                  select
                                  i32.shl
                                  local.set 2
                                  i32.const 0
                                  local.set 5
                                  loop  ;; label = @16
                                    block  ;; label = @17
                                      local.get 0
                                      i32.load offset=4
                                      i32.const -8
                                      i32.and
                                      local.get 6
                                      i32.sub
                                      local.tee 4
                                      local.get 3
                                      i32.ge_u
                                      br_if 0 (;@17;)
                                      local.get 0
                                      local.set 5
                                      local.get 4
                                      local.tee 3
                                      br_if 0 (;@17;)
                                      i32.const 0
                                      local.set 3
                                      local.get 0
                                      local.set 1
                                      br 3 (;@14;)
                                    end
                                    local.get 1
                                    local.get 0
                                    i32.load offset=20
                                    local.tee 4
                                    local.get 4
                                    local.get 0
                                    local.get 2
                                    i32.const 29
                                    i32.shr_u
                                    i32.const 4
                                    i32.and
                                    i32.add
                                    i32.const 16
                                    i32.add
                                    i32.load
                                    local.tee 0
                                    i32.eq
                                    select
                                    local.get 1
                                    local.get 4
                                    select
                                    local.set 1
                                    local.get 2
                                    i32.const 1
                                    i32.shl
                                    local.set 2
                                    local.get 0
                                    br_if 0 (;@16;)
                                  end
                                end
                                local.get 1
                                local.get 5
                                i32.or
                                i32.eqz
                                if  ;; label = @15
                                  i32.const 0
                                  local.set 5
                                  i32.const 2
                                  local.get 9
                                  i32.shl
                                  local.tee 0
                                  i32.const 0
                                  local.get 0
                                  i32.sub
                                  i32.or
                                  local.get 8
                                  i32.and
                                  local.tee 0
                                  i32.eqz
                                  br_if 3 (;@12;)
                                  local.get 0
                                  i32.ctz
                                  i32.const 2
                                  i32.shl
                                  i32.const 1336
                                  i32.add
                                  i32.load
                                  local.set 1
                                end
                                local.get 1
                                i32.eqz
                                br_if 1 (;@13;)
                              end
                              loop  ;; label = @14
                                local.get 1
                                i32.load offset=4
                                i32.const -8
                                i32.and
                                local.get 6
                                i32.sub
                                local.tee 2
                                local.get 3
                                i32.lt_u
                                local.set 0
                                local.get 2
                                local.get 3
                                local.get 0
                                select
                                local.set 3
                                local.get 1
                                local.get 5
                                local.get 0
                                select
                                local.set 5
                                local.get 1
                                i32.load offset=16
                                local.tee 0
                                if (result i32)  ;; label = @15
                                  local.get 0
                                else
                                  local.get 1
                                  i32.load offset=20
                                end
                                local.tee 1
                                br_if 0 (;@14;)
                              end
                            end
                            local.get 5
                            i32.eqz
                            br_if 0 (;@12;)
                            local.get 3
                            i32.const 1040
                            i32.load
                            local.get 6
                            i32.sub
                            i32.ge_u
                            br_if 0 (;@12;)
                            local.get 5
                            i32.load offset=24
                            local.set 7
                            local.get 5
                            local.get 5
                            i32.load offset=12
                            local.tee 1
                            i32.ne
                            if  ;; label = @13
                              local.get 5
                              i32.load offset=8
                              local.tee 0
                              local.get 1
                              i32.store offset=12
                              local.get 1
                              local.get 0
                              i32.store offset=8
                              br 10 (;@3;)
                            end
                            local.get 5
                            i32.load offset=20
                            local.tee 0
                            if (result i32)  ;; label = @13
                              local.get 5
                              i32.const 20
                              i32.add
                            else
                              local.get 5
                              i32.load offset=16
                              local.tee 0
                              i32.eqz
                              br_if 3 (;@10;)
                              local.get 5
                              i32.const 16
                              i32.add
                            end
                            local.set 2
                            loop  ;; label = @13
                              local.get 2
                              local.set 4
                              local.get 0
                              local.tee 1
                              i32.const 20
                              i32.add
                              local.set 2
                              local.get 1
                              i32.load offset=20
                              local.tee 0
                              br_if 0 (;@13;)
                              local.get 1
                              i32.const 16
                              i32.add
                              local.set 2
                              local.get 1
                              i32.load offset=16
                              local.tee 0
                              br_if 0 (;@13;)
                            end
                            local.get 4
                            i32.const 0
                            i32.store
                            br 9 (;@3;)
                          end
                          local.get 6
                          i32.const 1040
                          i32.load
                          local.tee 5
                          i32.le_u
                          if  ;; label = @12
                            i32.const 1052
                            i32.load
                            local.set 1
                            block  ;; label = @13
                              local.get 5
                              local.get 6
                              i32.sub
                              local.tee 0
                              i32.const 16
                              i32.ge_u
                              if  ;; label = @14
                                local.get 1
                                local.get 6
                                i32.add
                                local.tee 2
                                local.get 0
                                i32.const 1
                                i32.or
                                i32.store offset=4
                                local.get 1
                                local.get 5
                                i32.add
                                local.get 0
                                i32.store
                                local.get 1
                                local.get 6
                                i32.const 3
                                i32.or
                                i32.store offset=4
                                br 1 (;@13;)
                              end
                              local.get 1
                              local.get 5
                              i32.const 3
                              i32.or
                              i32.store offset=4
                              local.get 1
                              local.get 5
                              i32.add
                              local.tee 0
                              local.get 0
                              i32.load offset=4
                              i32.const 1
                              i32.or
                              i32.store offset=4
                              i32.const 0
                              local.set 2
                              i32.const 0
                              local.set 0
                            end
                            i32.const 1040
                            local.get 0
                            i32.store
                            i32.const 1052
                            local.get 2
                            i32.store
                            local.get 1
                            i32.const 8
                            i32.add
                            local.set 1
                            br 11 (;@1;)
                          end
                          local.get 6
                          i32.const 1044
                          i32.load
                          local.tee 2
                          i32.lt_u
                          if  ;; label = @12
                            local.get 6
                            local.get 7
                            i32.add
                            local.tee 0
                            local.get 2
                            local.get 6
                            i32.sub
                            local.tee 1
                            i32.const 1
                            i32.or
                            i32.store offset=4
                            i32.const 1056
                            local.get 0
                            i32.store
                            i32.const 1044
                            local.get 1
                            i32.store
                            local.get 7
                            local.get 6
                            i32.const 3
                            i32.or
                            i32.store offset=4
                            local.get 7
                            i32.const 8
                            i32.add
                            local.set 1
                            br 11 (;@1;)
                          end
                          i32.const 0
                          local.set 1
                          local.get 6
                          local.get 6
                          i32.const 71
                          i32.add
                          local.tee 5
                          block (result i32)  ;; label = @12
                            i32.const 1504
                            i32.load
                            if  ;; label = @13
                              i32.const 1512
                              i32.load
                              br 1 (;@12;)
                            end
                            i32.const 1516
                            i64.const -1
                            i64.store align=4
                            i32.const 1508
                            i64.const 281474976776192
                            i64.store align=4
                            i32.const 1504
                            local.get 10
                            i32.const 12
                            i32.add
                            i32.const -16
                            i32.and
                            i32.const 1431655768
                            i32.xor
                            i32.store
                            i32.const 1524
                            i32.const 0
                            i32.store
                            i32.const 1476
                            i32.const 0
                            i32.store
                            i32.const 65536
                          end
                          local.tee 0
                          i32.add
                          local.tee 3
                          i32.const 0
                          local.get 0
                          i32.sub
                          local.tee 4
                          i32.and
                          local.tee 0
                          i32.ge_u
                          if  ;; label = @12
                            i32.const 1528
                            i32.const 48
                            i32.store
                            br 11 (;@1;)
                          end
                          block  ;; label = @12
                            i32.const 1472
                            i32.load
                            local.tee 1
                            i32.eqz
                            br_if 0 (;@12;)
                            i32.const 1464
                            i32.load
                            local.tee 8
                            local.get 0
                            i32.add
                            local.tee 9
                            local.get 8
                            i32.gt_u
                            local.get 1
                            local.get 9
                            i32.ge_u
                            i32.and
                            br_if 0 (;@12;)
                            i32.const 0
                            local.set 1
                            i32.const 1528
                            i32.const 48
                            i32.store
                            br 11 (;@1;)
                          end
                          i32.const 1476
                          i32.load8_u
                          i32.const 4
                          i32.and
                          br_if 4 (;@7;)
                          block  ;; label = @12
                            block  ;; label = @13
                              local.get 7
                              if  ;; label = @14
                                i32.const 1480
                                local.set 1
                                loop  ;; label = @15
                                  local.get 7
                                  local.get 1
                                  i32.load
                                  local.tee 8
                                  i32.ge_u
                                  if  ;; label = @16
                                    local.get 8
                                    local.get 1
                                    i32.load offset=4
                                    i32.add
                                    local.get 7
                                    i32.gt_u
                                    br_if 3 (;@13;)
                                  end
                                  local.get 1
                                  i32.load offset=8
                                  local.tee 1
                                  br_if 0 (;@15;)
                                end
                              end
                              i32.const 0
                              call 76
                              local.tee 2
                              i32.const -1
                              i32.eq
                              br_if 5 (;@8;)
                              local.get 0
                              local.set 4
                              i32.const 1508
                              i32.load
                              local.tee 1
                              i32.const 1
                              i32.sub
                              local.tee 3
                              local.get 2
                              i32.and
                              if  ;; label = @14
                                local.get 0
                                local.get 2
                                i32.sub
                                local.get 2
                                local.get 3
                                i32.add
                                i32.const 0
                                local.get 1
                                i32.sub
                                i32.and
                                i32.add
                                local.set 4
                              end
                              local.get 4
                              local.get 6
                              i32.le_u
                              br_if 5 (;@8;)
                              local.get 4
                              i32.const 2147483646
                              i32.gt_u
                              br_if 5 (;@8;)
                              i32.const 1472
                              i32.load
                              local.tee 1
                              if  ;; label = @14
                                i32.const 1464
                                i32.load
                                local.tee 3
                                local.get 4
                                i32.add
                                local.tee 7
                                local.get 3
                                i32.le_u
                                br_if 6 (;@8;)
                                local.get 1
                                local.get 7
                                i32.lt_u
                                br_if 6 (;@8;)
                              end
                              local.get 4
                              call 76
                              local.tee 1
                              local.get 2
                              i32.ne
                              br_if 1 (;@12;)
                              br 7 (;@6;)
                            end
                            local.get 3
                            local.get 2
                            i32.sub
                            local.get 4
                            i32.and
                            local.tee 4
                            i32.const 2147483646
                            i32.gt_u
                            br_if 4 (;@8;)
                            local.get 4
                            call 76
                            local.tee 2
                            local.get 1
                            i32.load
                            local.get 1
                            i32.load offset=4
                            i32.add
                            i32.eq
                            br_if 3 (;@9;)
                            local.get 2
                            local.set 1
                          end
                          block  ;; label = @12
                            local.get 4
                            local.get 6
                            i32.const 72
                            i32.add
                            i32.ge_u
                            br_if 0 (;@12;)
                            local.get 1
                            i32.const -1
                            i32.eq
                            br_if 0 (;@12;)
                            i32.const 1512
                            i32.load
                            local.tee 2
                            local.get 5
                            local.get 4
                            i32.sub
                            i32.add
                            i32.const 0
                            local.get 2
                            i32.sub
                            i32.and
                            local.tee 2
                            i32.const 2147483646
                            i32.gt_u
                            if  ;; label = @13
                              local.get 1
                              local.set 2
                              br 7 (;@6;)
                            end
                            local.get 2
                            call 76
                            i32.const -1
                            i32.ne
                            if  ;; label = @13
                              local.get 2
                              local.get 4
                              i32.add
                              local.set 4
                              local.get 1
                              local.set 2
                              br 7 (;@6;)
                            end
                            i32.const 0
                            local.get 4
                            i32.sub
                            call 76
                            drop
                            br 4 (;@8;)
                          end
                          local.get 1
                          local.tee 2
                          i32.const -1
                          i32.ne
                          br_if 5 (;@6;)
                          br 3 (;@8;)
                        end
                        i32.const 0
                        local.set 1
                        br 8 (;@2;)
                      end
                      i32.const 0
                      local.set 1
                      br 6 (;@3;)
                    end
                    local.get 2
                    i32.const -1
                    i32.ne
                    br_if 2 (;@6;)
                  end
                  i32.const 1476
                  i32.const 1476
                  i32.load
                  i32.const 4
                  i32.or
                  i32.store
                end
                local.get 0
                i32.const 2147483646
                i32.gt_u
                br_if 1 (;@5;)
                local.get 0
                call 76
                local.set 2
                i32.const 0
                call 76
                local.set 0
                local.get 2
                i32.const -1
                i32.eq
                br_if 1 (;@5;)
                local.get 0
                i32.const -1
                i32.eq
                br_if 1 (;@5;)
                local.get 0
                local.get 2
                i32.le_u
                br_if 1 (;@5;)
                local.get 0
                local.get 2
                i32.sub
                local.tee 4
                local.get 6
                i32.const 56
                i32.add
                i32.le_u
                br_if 1 (;@5;)
              end
              i32.const 1464
              i32.const 1464
              i32.load
              local.get 4
              i32.add
              local.tee 0
              i32.store
              i32.const 1468
              i32.load
              local.get 0
              i32.lt_u
              if  ;; label = @6
                i32.const 1468
                local.get 0
                i32.store
              end
              block  ;; label = @6
                block  ;; label = @7
                  block  ;; label = @8
                    i32.const 1056
                    i32.load
                    local.tee 3
                    if  ;; label = @9
                      i32.const 1480
                      local.set 1
                      loop  ;; label = @10
                        local.get 2
                        local.get 1
                        i32.load
                        local.tee 0
                        local.get 1
                        i32.load offset=4
                        local.tee 5
                        i32.add
                        i32.eq
                        br_if 2 (;@8;)
                        local.get 1
                        i32.load offset=8
                        local.tee 1
                        br_if 0 (;@10;)
                      end
                      br 2 (;@7;)
                    end
                    i32.const 1048
                    i32.load
                    local.tee 0
                    i32.const 0
                    local.get 0
                    local.get 2
                    i32.le_u
                    select
                    i32.eqz
                    if  ;; label = @9
                      i32.const 1048
                      local.get 2
                      i32.store
                    end
                    i32.const 0
                    local.set 1
                    i32.const 1484
                    local.get 4
                    i32.store
                    i32.const 1480
                    local.get 2
                    i32.store
                    i32.const 1064
                    i32.const -1
                    i32.store
                    i32.const 1068
                    i32.const 1504
                    i32.load
                    i32.store
                    i32.const 1492
                    i32.const 0
                    i32.store
                    loop  ;; label = @9
                      local.get 1
                      i32.const 1092
                      i32.add
                      local.get 1
                      i32.const 1080
                      i32.add
                      local.tee 0
                      i32.store
                      local.get 0
                      local.get 1
                      i32.const 1072
                      i32.add
                      local.tee 5
                      i32.store
                      local.get 1
                      i32.const 1084
                      i32.add
                      local.get 5
                      i32.store
                      local.get 1
                      i32.const 1100
                      i32.add
                      local.get 1
                      i32.const 1088
                      i32.add
                      local.tee 5
                      i32.store
                      local.get 5
                      local.get 0
                      i32.store
                      local.get 1
                      i32.const 1108
                      i32.add
                      local.get 1
                      i32.const 1096
                      i32.add
                      local.tee 0
                      i32.store
                      local.get 0
                      local.get 5
                      i32.store
                      local.get 1
                      i32.const 1104
                      i32.add
                      local.get 0
                      i32.store
                      local.get 1
                      i32.const 32
                      i32.add
                      local.tee 1
                      i32.const 256
                      i32.ne
                      br_if 0 (;@9;)
                    end
                    local.get 2
                    i32.const -8
                    local.get 2
                    i32.sub
                    i32.const 15
                    i32.and
                    local.tee 0
                    i32.add
                    local.tee 1
                    local.get 4
                    i32.const 56
                    i32.sub
                    local.tee 5
                    local.get 0
                    i32.sub
                    local.tee 0
                    i32.const 1
                    i32.or
                    i32.store offset=4
                    i32.const 1060
                    i32.const 1520
                    i32.load
                    i32.store
                    i32.const 1044
                    local.get 0
                    i32.store
                    i32.const 1056
                    local.get 1
                    i32.store
                    local.get 2
                    local.get 5
                    i32.add
                    i32.const 56
                    i32.store offset=4
                    br 2 (;@6;)
                  end
                  local.get 2
                  local.get 3
                  i32.le_u
                  br_if 0 (;@7;)
                  local.get 0
                  local.get 3
                  i32.gt_u
                  br_if 0 (;@7;)
                  local.get 1
                  i32.load offset=12
                  i32.const 8
                  i32.and
                  br_if 0 (;@7;)
                  local.get 3
                  i32.const -8
                  local.get 3
                  i32.sub
                  i32.const 15
                  i32.and
                  local.tee 0
                  i32.add
                  local.tee 2
                  i32.const 1044
                  i32.load
                  local.get 4
                  i32.add
                  local.tee 7
                  local.get 0
                  i32.sub
                  local.tee 0
                  i32.const 1
                  i32.or
                  i32.store offset=4
                  local.get 1
                  local.get 4
                  local.get 5
                  i32.add
                  i32.store offset=4
                  i32.const 1060
                  i32.const 1520
                  i32.load
                  i32.store
                  i32.const 1044
                  local.get 0
                  i32.store
                  i32.const 1056
                  local.get 2
                  i32.store
                  local.get 3
                  local.get 7
                  i32.add
                  i32.const 56
                  i32.store offset=4
                  br 1 (;@6;)
                end
                i32.const 1048
                i32.load
                local.get 2
                i32.gt_u
                if  ;; label = @7
                  i32.const 1048
                  local.get 2
                  i32.store
                end
                local.get 2
                local.get 4
                i32.add
                local.set 5
                i32.const 1480
                local.set 1
                block  ;; label = @7
                  loop  ;; label = @8
                    local.get 5
                    local.get 1
                    i32.load
                    local.tee 0
                    i32.ne
                    if  ;; label = @9
                      local.get 1
                      i32.load offset=8
                      local.tee 1
                      br_if 1 (;@8;)
                      br 2 (;@7;)
                    end
                  end
                  local.get 1
                  i32.load8_u offset=12
                  i32.const 8
                  i32.and
                  i32.eqz
                  br_if 3 (;@4;)
                end
                i32.const 1480
                local.set 1
                loop  ;; label = @7
                  block  ;; label = @8
                    local.get 3
                    local.get 1
                    i32.load
                    local.tee 0
                    i32.ge_u
                    if  ;; label = @9
                      local.get 0
                      local.get 1
                      i32.load offset=4
                      i32.add
                      local.tee 5
                      local.get 3
                      i32.gt_u
                      br_if 1 (;@8;)
                    end
                    local.get 1
                    i32.load offset=8
                    local.set 1
                    br 1 (;@7;)
                  end
                end
                local.get 2
                i32.const -8
                local.get 2
                i32.sub
                i32.const 15
                i32.and
                local.tee 0
                i32.add
                local.tee 1
                local.get 4
                i32.const 56
                i32.sub
                local.tee 7
                local.get 0
                i32.sub
                local.tee 8
                i32.const 1
                i32.or
                i32.store offset=4
                local.get 2
                local.get 7
                i32.add
                i32.const 56
                i32.store offset=4
                local.get 3
                local.get 5
                i32.const 55
                local.get 5
                i32.sub
                i32.const 15
                i32.and
                i32.add
                i32.const 63
                i32.sub
                local.tee 0
                local.get 0
                local.get 3
                i32.const 16
                i32.add
                i32.lt_u
                select
                local.tee 0
                i32.const 35
                i32.store offset=4
                i32.const 1060
                i32.const 1520
                i32.load
                i32.store
                i32.const 1044
                local.get 8
                i32.store
                i32.const 1056
                local.get 1
                i32.store
                local.get 0
                i32.const 16
                i32.add
                i32.const 1488
                i64.load align=4
                i64.store align=4
                local.get 0
                i32.const 1480
                i64.load align=4
                i64.store offset=8 align=4
                i32.const 1488
                local.get 0
                i32.const 8
                i32.add
                i32.store
                i32.const 1484
                local.get 4
                i32.store
                i32.const 1480
                local.get 2
                i32.store
                i32.const 1492
                i32.const 0
                i32.store
                local.get 0
                i32.const 36
                i32.add
                local.set 1
                loop  ;; label = @7
                  local.get 1
                  i32.const 7
                  i32.store
                  local.get 1
                  i32.const 4
                  i32.add
                  local.tee 1
                  local.get 5
                  i32.lt_u
                  br_if 0 (;@7;)
                end
                local.get 0
                local.get 3
                i32.eq
                br_if 0 (;@6;)
                local.get 0
                local.get 0
                i32.load offset=4
                i32.const -2
                i32.and
                i32.store offset=4
                local.get 0
                local.get 0
                local.get 3
                i32.sub
                local.tee 2
                i32.store
                local.get 3
                local.get 2
                i32.const 1
                i32.or
                i32.store offset=4
                block (result i32)  ;; label = @7
                  local.get 2
                  i32.const 255
                  i32.le_u
                  if  ;; label = @8
                    local.get 2
                    i32.const -8
                    i32.and
                    i32.const 1072
                    i32.add
                    local.set 1
                    block (result i32)  ;; label = @9
                      i32.const 1032
                      i32.load
                      local.tee 0
                      i32.const 1
                      local.get 2
                      i32.const 3
                      i32.shr_u
                      i32.shl
                      local.tee 2
                      i32.and
                      i32.eqz
                      if  ;; label = @10
                        i32.const 1032
                        local.get 0
                        local.get 2
                        i32.or
                        i32.store
                        local.get 1
                        br 1 (;@9;)
                      end
                      local.get 1
                      i32.load offset=8
                    end
                    local.tee 0
                    local.get 3
                    i32.store offset=12
                    local.get 1
                    local.get 3
                    i32.store offset=8
                    i32.const 8
                    local.set 5
                    i32.const 12
                    br 1 (;@7;)
                  end
                  i32.const 31
                  local.set 1
                  local.get 2
                  i32.const 16777215
                  i32.le_u
                  if  ;; label = @8
                    local.get 2
                    i32.const 38
                    local.get 2
                    i32.const 8
                    i32.shr_u
                    i32.clz
                    local.tee 0
                    i32.sub
                    i32.shr_u
                    i32.const 1
                    i32.and
                    local.get 0
                    i32.const 1
                    i32.shl
                    i32.sub
                    i32.const 62
                    i32.add
                    local.set 1
                  end
                  local.get 3
                  local.get 1
                  i32.store offset=28
                  local.get 3
                  i64.const 0
                  i64.store offset=16 align=4
                  local.get 1
                  i32.const 2
                  i32.shl
                  i32.const 1336
                  i32.add
                  local.set 0
                  block  ;; label = @8
                    block  ;; label = @9
                      i32.const 1036
                      i32.load
                      local.tee 5
                      i32.const 1
                      local.get 1
                      i32.shl
                      local.tee 4
                      i32.and
                      i32.eqz
                      if  ;; label = @10
                        local.get 0
                        local.get 3
                        i32.store
                        i32.const 1036
                        local.get 4
                        local.get 5
                        i32.or
                        i32.store
                        br 1 (;@9;)
                      end
                      local.get 2
                      i32.const 0
                      i32.const 25
                      local.get 1
                      i32.const 1
                      i32.shr_u
                      i32.sub
                      local.get 1
                      i32.const 31
                      i32.eq
                      select
                      i32.shl
                      local.set 1
                      local.get 0
                      i32.load
                      local.set 5
                      loop  ;; label = @10
                        local.get 5
                        local.tee 0
                        i32.load offset=4
                        i32.const -8
                        i32.and
                        local.get 2
                        i32.eq
                        br_if 2 (;@8;)
                        local.get 1
                        i32.const 29
                        i32.shr_u
                        local.set 5
                        local.get 1
                        i32.const 1
                        i32.shl
                        local.set 1
                        local.get 0
                        local.get 5
                        i32.const 4
                        i32.and
                        i32.add
                        i32.const 16
                        i32.add
                        local.tee 4
                        i32.load
                        local.tee 5
                        br_if 0 (;@10;)
                      end
                      local.get 4
                      local.get 3
                      i32.store
                    end
                    local.get 3
                    local.get 0
                    i32.store offset=24
                    i32.const 12
                    local.set 5
                    local.get 3
                    local.tee 0
                    local.set 1
                    i32.const 8
                    br 1 (;@7;)
                  end
                  local.get 0
                  i32.load offset=8
                  local.set 1
                  local.get 0
                  local.get 3
                  i32.store offset=8
                  local.get 1
                  local.get 3
                  i32.store offset=12
                  local.get 3
                  local.get 1
                  i32.store offset=8
                  i32.const 0
                  local.set 1
                  i32.const 12
                  local.set 5
                  i32.const 24
                end
                local.set 2
                local.get 3
                local.get 5
                i32.add
                local.get 0
                i32.store
                local.get 2
                local.get 3
                i32.add
                local.get 1
                i32.store
              end
              i32.const 1044
              i32.load
              local.tee 1
              local.get 6
              i32.le_u
              br_if 0 (;@5;)
              i32.const 1056
              i32.load
              local.tee 0
              local.get 6
              i32.add
              local.tee 2
              local.get 1
              local.get 6
              i32.sub
              local.tee 1
              i32.const 1
              i32.or
              i32.store offset=4
              i32.const 1044
              local.get 1
              i32.store
              i32.const 1056
              local.get 2
              i32.store
              local.get 0
              local.get 6
              i32.const 3
              i32.or
              i32.store offset=4
              local.get 0
              i32.const 8
              i32.add
              local.set 1
              br 4 (;@1;)
            end
            i32.const 0
            local.set 1
            i32.const 1528
            i32.const 48
            i32.store
            br 3 (;@1;)
          end
          local.get 1
          local.get 2
          i32.store
          local.get 1
          local.get 1
          i32.load offset=4
          local.get 4
          i32.add
          i32.store offset=4
          local.get 2
          i32.const -8
          local.get 2
          i32.sub
          i32.const 15
          i32.and
          i32.add
          local.tee 8
          local.get 6
          i32.const 3
          i32.or
          i32.store offset=4
          local.get 0
          i32.const -8
          local.get 0
          i32.sub
          i32.const 15
          i32.and
          i32.add
          local.tee 4
          local.get 6
          local.get 8
          i32.add
          local.tee 3
          i32.sub
          local.set 7
          block  ;; label = @4
            i32.const 1056
            i32.load
            local.get 4
            i32.eq
            if  ;; label = @5
              i32.const 1056
              local.get 3
              i32.store
              i32.const 1044
              i32.const 1044
              i32.load
              local.get 7
              i32.add
              local.tee 0
              i32.store
              local.get 3
              local.get 0
              i32.const 1
              i32.or
              i32.store offset=4
              br 1 (;@4;)
            end
            i32.const 1052
            i32.load
            local.get 4
            i32.eq
            if  ;; label = @5
              i32.const 1052
              local.get 3
              i32.store
              i32.const 1040
              i32.const 1040
              i32.load
              local.get 7
              i32.add
              local.tee 0
              i32.store
              local.get 3
              local.get 0
              i32.const 1
              i32.or
              i32.store offset=4
              local.get 0
              local.get 3
              i32.add
              local.get 0
              i32.store
              br 1 (;@4;)
            end
            local.get 4
            i32.load offset=4
            local.tee 2
            i32.const 3
            i32.and
            i32.const 1
            i32.eq
            if  ;; label = @5
              local.get 2
              i32.const -8
              i32.and
              local.set 9
              local.get 4
              i32.load offset=12
              local.set 1
              block  ;; label = @6
                local.get 2
                i32.const 255
                i32.le_u
                if  ;; label = @7
                  local.get 4
                  i32.load offset=8
                  local.tee 0
                  local.get 1
                  i32.eq
                  if  ;; label = @8
                    i32.const 1032
                    i32.const 1032
                    i32.load
                    i32.const -2
                    local.get 2
                    i32.const 3
                    i32.shr_u
                    i32.rotl
                    i32.and
                    i32.store
                    br 2 (;@6;)
                  end
                  local.get 1
                  local.get 0
                  i32.store offset=8
                  local.get 0
                  local.get 1
                  i32.store offset=12
                  br 1 (;@6;)
                end
                local.get 4
                i32.load offset=24
                local.set 6
                block  ;; label = @7
                  local.get 1
                  local.get 4
                  i32.ne
                  if  ;; label = @8
                    local.get 4
                    i32.load offset=8
                    local.tee 0
                    local.get 1
                    i32.store offset=12
                    local.get 1
                    local.get 0
                    i32.store offset=8
                    br 1 (;@7;)
                  end
                  block  ;; label = @8
                    local.get 4
                    i32.load offset=20
                    local.tee 2
                    if (result i32)  ;; label = @9
                      local.get 4
                      i32.const 20
                      i32.add
                    else
                      local.get 4
                      i32.load offset=16
                      local.tee 2
                      i32.eqz
                      br_if 1 (;@8;)
                      local.get 4
                      i32.const 16
                      i32.add
                    end
                    local.set 0
                    loop  ;; label = @9
                      local.get 0
                      local.set 5
                      local.get 2
                      local.tee 1
                      i32.const 20
                      i32.add
                      local.set 0
                      local.get 1
                      i32.load offset=20
                      local.tee 2
                      br_if 0 (;@9;)
                      local.get 1
                      i32.const 16
                      i32.add
                      local.set 0
                      local.get 1
                      i32.load offset=16
                      local.tee 2
                      br_if 0 (;@9;)
                    end
                    local.get 5
                    i32.const 0
                    i32.store
                    br 1 (;@7;)
                  end
                  i32.const 0
                  local.set 1
                end
                local.get 6
                i32.eqz
                br_if 0 (;@6;)
                block  ;; label = @7
                  local.get 4
                  i32.load offset=28
                  local.tee 0
                  i32.const 2
                  i32.shl
                  i32.const 1336
                  i32.add
                  local.tee 2
                  i32.load
                  local.get 4
                  i32.eq
                  if  ;; label = @8
                    local.get 2
                    local.get 1
                    i32.store
                    local.get 1
                    br_if 1 (;@7;)
                    i32.const 1036
                    i32.const 1036
                    i32.load
                    i32.const -2
                    local.get 0
                    i32.rotl
                    i32.and
                    i32.store
                    br 2 (;@6;)
                  end
                  local.get 6
                  i32.const 16
                  i32.const 20
                  local.get 6
                  i32.load offset=16
                  local.get 4
                  i32.eq
                  select
                  i32.add
                  local.get 1
                  i32.store
                  local.get 1
                  i32.eqz
                  br_if 1 (;@6;)
                end
                local.get 1
                local.get 6
                i32.store offset=24
                local.get 4
                i32.load offset=16
                local.tee 0
                if  ;; label = @7
                  local.get 1
                  local.get 0
                  i32.store offset=16
                  local.get 0
                  local.get 1
                  i32.store offset=24
                end
                local.get 4
                i32.load offset=20
                local.tee 0
                i32.eqz
                br_if 0 (;@6;)
                local.get 1
                local.get 0
                i32.store offset=20
                local.get 0
                local.get 1
                i32.store offset=24
              end
              local.get 7
              local.get 9
              i32.add
              local.set 7
              local.get 4
              local.get 9
              i32.add
              local.tee 4
              i32.load offset=4
              local.set 2
            end
            local.get 4
            local.get 2
            i32.const -2
            i32.and
            i32.store offset=4
            local.get 3
            local.get 7
            i32.add
            local.get 7
            i32.store
            local.get 3
            local.get 7
            i32.const 1
            i32.or
            i32.store offset=4
            local.get 7
            i32.const 255
            i32.le_u
            if  ;; label = @5
              local.get 7
              i32.const -8
              i32.and
              i32.const 1072
              i32.add
              local.set 0
              block (result i32)  ;; label = @6
                i32.const 1032
                i32.load
                local.tee 1
                i32.const 1
                local.get 7
                i32.const 3
                i32.shr_u
                i32.shl
                local.tee 2
                i32.and
                i32.eqz
                if  ;; label = @7
                  i32.const 1032
                  local.get 1
                  local.get 2
                  i32.or
                  i32.store
                  local.get 0
                  br 1 (;@6;)
                end
                local.get 0
                i32.load offset=8
              end
              local.tee 1
              local.get 3
              i32.store offset=12
              local.get 0
              local.get 3
              i32.store offset=8
              local.get 3
              local.get 0
              i32.store offset=12
              local.get 3
              local.get 1
              i32.store offset=8
              br 1 (;@4;)
            end
            i32.const 31
            local.set 1
            local.get 7
            i32.const 16777215
            i32.le_u
            if  ;; label = @5
              local.get 7
              i32.const 38
              local.get 7
              i32.const 8
              i32.shr_u
              i32.clz
              local.tee 0
              i32.sub
              i32.shr_u
              i32.const 1
              i32.and
              local.get 0
              i32.const 1
              i32.shl
              i32.sub
              i32.const 62
              i32.add
              local.set 1
            end
            local.get 3
            local.get 1
            i32.store offset=28
            local.get 3
            i64.const 0
            i64.store offset=16 align=4
            local.get 1
            i32.const 2
            i32.shl
            i32.const 1336
            i32.add
            local.set 0
            i32.const 1036
            i32.load
            local.tee 2
            i32.const 1
            local.get 1
            i32.shl
            local.tee 5
            i32.and
            i32.eqz
            if  ;; label = @5
              local.get 0
              local.get 3
              i32.store
              i32.const 1036
              local.get 2
              local.get 5
              i32.or
              i32.store
              local.get 3
              local.get 0
              i32.store offset=24
              local.get 3
              local.get 3
              i32.store offset=8
              local.get 3
              local.get 3
              i32.store offset=12
              br 1 (;@4;)
            end
            local.get 7
            i32.const 0
            i32.const 25
            local.get 1
            i32.const 1
            i32.shr_u
            i32.sub
            local.get 1
            i32.const 31
            i32.eq
            select
            i32.shl
            local.set 1
            local.get 0
            i32.load
            local.set 0
            block  ;; label = @5
              loop  ;; label = @6
                local.get 0
                local.tee 2
                i32.load offset=4
                i32.const -8
                i32.and
                local.get 7
                i32.eq
                br_if 1 (;@5;)
                local.get 1
                i32.const 29
                i32.shr_u
                local.set 0
                local.get 1
                i32.const 1
                i32.shl
                local.set 1
                local.get 2
                local.get 0
                i32.const 4
                i32.and
                i32.add
                i32.const 16
                i32.add
                local.tee 5
                i32.load
                local.tee 0
                br_if 0 (;@6;)
              end
              local.get 5
              local.get 3
              i32.store
              local.get 3
              local.get 2
              i32.store offset=24
              local.get 3
              local.get 3
              i32.store offset=12
              local.get 3
              local.get 3
              i32.store offset=8
              br 1 (;@4;)
            end
            local.get 2
            i32.load offset=8
            local.tee 0
            local.get 3
            i32.store offset=12
            local.get 2
            local.get 3
            i32.store offset=8
            local.get 3
            i32.const 0
            i32.store offset=24
            local.get 3
            local.get 2
            i32.store offset=12
            local.get 3
            local.get 0
            i32.store offset=8
          end
          local.get 8
          i32.const 8
          i32.add
          local.set 1
          br 2 (;@1;)
        end
        block  ;; label = @3
          local.get 7
          i32.eqz
          br_if 0 (;@3;)
          block  ;; label = @4
            local.get 5
            i32.load offset=28
            local.tee 0
            i32.const 2
            i32.shl
            i32.const 1336
            i32.add
            local.tee 2
            i32.load
            local.get 5
            i32.eq
            if  ;; label = @5
              local.get 2
              local.get 1
              i32.store
              local.get 1
              br_if 1 (;@4;)
              i32.const 1036
              local.get 8
              i32.const -2
              local.get 0
              i32.rotl
              i32.and
              local.tee 8
              i32.store
              br 2 (;@3;)
            end
            local.get 7
            i32.const 16
            i32.const 20
            local.get 7
            i32.load offset=16
            local.get 5
            i32.eq
            select
            i32.add
            local.get 1
            i32.store
            local.get 1
            i32.eqz
            br_if 1 (;@3;)
          end
          local.get 1
          local.get 7
          i32.store offset=24
          local.get 5
          i32.load offset=16
          local.tee 0
          if  ;; label = @4
            local.get 1
            local.get 0
            i32.store offset=16
            local.get 0
            local.get 1
            i32.store offset=24
          end
          local.get 5
          i32.load offset=20
          local.tee 0
          i32.eqz
          br_if 0 (;@3;)
          local.get 1
          local.get 0
          i32.store offset=20
          local.get 0
          local.get 1
          i32.store offset=24
        end
        block  ;; label = @3
          local.get 3
          i32.const 15
          i32.le_u
          if  ;; label = @4
            local.get 5
            local.get 3
            local.get 6
            i32.or
            local.tee 0
            i32.const 3
            i32.or
            i32.store offset=4
            local.get 0
            local.get 5
            i32.add
            local.tee 0
            local.get 0
            i32.load offset=4
            i32.const 1
            i32.or
            i32.store offset=4
            br 1 (;@3;)
          end
          local.get 5
          local.get 6
          i32.add
          local.tee 4
          local.get 3
          i32.const 1
          i32.or
          i32.store offset=4
          local.get 5
          local.get 6
          i32.const 3
          i32.or
          i32.store offset=4
          local.get 3
          local.get 4
          i32.add
          local.get 3
          i32.store
          local.get 3
          i32.const 255
          i32.le_u
          if  ;; label = @4
            local.get 3
            i32.const -8
            i32.and
            i32.const 1072
            i32.add
            local.set 0
            block (result i32)  ;; label = @5
              i32.const 1032
              i32.load
              local.tee 1
              i32.const 1
              local.get 3
              i32.const 3
              i32.shr_u
              i32.shl
              local.tee 2
              i32.and
              i32.eqz
              if  ;; label = @6
                i32.const 1032
                local.get 1
                local.get 2
                i32.or
                i32.store
                local.get 0
                br 1 (;@5;)
              end
              local.get 0
              i32.load offset=8
            end
            local.tee 1
            local.get 4
            i32.store offset=12
            local.get 0
            local.get 4
            i32.store offset=8
            local.get 4
            local.get 0
            i32.store offset=12
            local.get 4
            local.get 1
            i32.store offset=8
            br 1 (;@3;)
          end
          i32.const 31
          local.set 1
          local.get 3
          i32.const 16777215
          i32.le_u
          if  ;; label = @4
            local.get 3
            i32.const 38
            local.get 3
            i32.const 8
            i32.shr_u
            i32.clz
            local.tee 0
            i32.sub
            i32.shr_u
            i32.const 1
            i32.and
            local.get 0
            i32.const 1
            i32.shl
            i32.sub
            i32.const 62
            i32.add
            local.set 1
          end
          local.get 4
          local.get 1
          i32.store offset=28
          local.get 4
          i64.const 0
          i64.store offset=16 align=4
          local.get 1
          i32.const 2
          i32.shl
          i32.const 1336
          i32.add
          local.set 0
          local.get 8
          i32.const 1
          local.get 1
          i32.shl
          local.tee 2
          i32.and
          i32.eqz
          if  ;; label = @4
            local.get 0
            local.get 4
            i32.store
            i32.const 1036
            local.get 2
            local.get 8
            i32.or
            i32.store
            local.get 4
            local.get 0
            i32.store offset=24
            local.get 4
            local.get 4
            i32.store offset=8
            local.get 4
            local.get 4
            i32.store offset=12
            br 1 (;@3;)
          end
          local.get 3
          i32.const 0
          i32.const 25
          local.get 1
          i32.const 1
          i32.shr_u
          i32.sub
          local.get 1
          i32.const 31
          i32.eq
          select
          i32.shl
          local.set 1
          local.get 0
          i32.load
          local.set 0
          block  ;; label = @4
            loop  ;; label = @5
              local.get 0
              local.tee 2
              i32.load offset=4
              i32.const -8
              i32.and
              local.get 3
              i32.eq
              br_if 1 (;@4;)
              local.get 1
              i32.const 29
              i32.shr_u
              local.set 0
              local.get 1
              i32.const 1
              i32.shl
              local.set 1
              local.get 2
              local.get 0
              i32.const 4
              i32.and
              i32.add
              i32.const 16
              i32.add
              local.tee 7
              i32.load
              local.tee 0
              br_if 0 (;@5;)
            end
            local.get 7
            local.get 4
            i32.store
            local.get 4
            local.get 2
            i32.store offset=24
            local.get 4
            local.get 4
            i32.store offset=12
            local.get 4
            local.get 4
            i32.store offset=8
            br 1 (;@3;)
          end
          local.get 2
          i32.load offset=8
          local.tee 0
          local.get 4
          i32.store offset=12
          local.get 2
          local.get 4
          i32.store offset=8
          local.get 4
          i32.const 0
          i32.store offset=24
          local.get 4
          local.get 2
          i32.store offset=12
          local.get 4
          local.get 0
          i32.store offset=8
        end
        local.get 5
        i32.const 8
        i32.add
        local.set 1
        br 1 (;@1;)
      end
      block  ;; label = @2
        local.get 9
        i32.eqz
        br_if 0 (;@2;)
        block  ;; label = @3
          local.get 2
          i32.load offset=28
          local.tee 0
          i32.const 2
          i32.shl
          i32.const 1336
          i32.add
          local.tee 5
          i32.load
          local.get 2
          i32.eq
          if  ;; label = @4
            local.get 5
            local.get 1
            i32.store
            local.get 1
            br_if 1 (;@3;)
            i32.const 1036
            local.get 11
            i32.const -2
            local.get 0
            i32.rotl
            i32.and
            i32.store
            br 2 (;@2;)
          end
          local.get 9
          i32.const 16
          i32.const 20
          local.get 9
          i32.load offset=16
          local.get 2
          i32.eq
          select
          i32.add
          local.get 1
          i32.store
          local.get 1
          i32.eqz
          br_if 1 (;@2;)
        end
        local.get 1
        local.get 9
        i32.store offset=24
        local.get 2
        i32.load offset=16
        local.tee 0
        if  ;; label = @3
          local.get 1
          local.get 0
          i32.store offset=16
          local.get 0
          local.get 1
          i32.store offset=24
        end
        local.get 2
        i32.load offset=20
        local.tee 0
        i32.eqz
        br_if 0 (;@2;)
        local.get 1
        local.get 0
        i32.store offset=20
        local.get 0
        local.get 1
        i32.store offset=24
      end
      block  ;; label = @2
        local.get 3
        i32.const 15
        i32.le_u
        if  ;; label = @3
          local.get 2
          local.get 3
          local.get 6
          i32.or
          local.tee 0
          i32.const 3
          i32.or
          i32.store offset=4
          local.get 0
          local.get 2
          i32.add
          local.tee 0
          local.get 0
          i32.load offset=4
          i32.const 1
          i32.or
          i32.store offset=4
          br 1 (;@2;)
        end
        local.get 2
        local.get 6
        i32.add
        local.tee 5
        local.get 3
        i32.const 1
        i32.or
        i32.store offset=4
        local.get 2
        local.get 6
        i32.const 3
        i32.or
        i32.store offset=4
        local.get 3
        local.get 5
        i32.add
        local.get 3
        i32.store
        local.get 8
        if  ;; label = @3
          local.get 8
          i32.const -8
          i32.and
          i32.const 1072
          i32.add
          local.set 0
          i32.const 1052
          i32.load
          local.set 1
          block (result i32)  ;; label = @4
            i32.const 1
            local.get 8
            i32.const 3
            i32.shr_u
            i32.shl
            local.tee 7
            local.get 4
            i32.and
            i32.eqz
            if  ;; label = @5
              i32.const 1032
              local.get 4
              local.get 7
              i32.or
              i32.store
              local.get 0
              br 1 (;@4;)
            end
            local.get 0
            i32.load offset=8
          end
          local.tee 4
          local.get 1
          i32.store offset=12
          local.get 0
          local.get 1
          i32.store offset=8
          local.get 1
          local.get 0
          i32.store offset=12
          local.get 1
          local.get 4
          i32.store offset=8
        end
        i32.const 1052
        local.get 5
        i32.store
        i32.const 1040
        local.get 3
        i32.store
      end
      local.get 2
      i32.const 8
      i32.add
      local.set 1
    end
    local.get 10
    i32.const 16
    i32.add
    global.set 0
    local.get 1)
  (func (;66;) (type 4) (param i32)
    local.get 0
    call 67)
  (func (;67;) (type 4) (param i32)
    (local i32 i32 i32 i32 i32 i32 i32)
    block  ;; label = @1
      local.get 0
      i32.eqz
      br_if 0 (;@1;)
      local.get 0
      i32.const 8
      i32.sub
      local.tee 3
      local.get 0
      i32.const 4
      i32.sub
      i32.load
      local.tee 1
      i32.const -8
      i32.and
      local.tee 0
      i32.add
      local.set 5
      block  ;; label = @2
        local.get 1
        i32.const 1
        i32.and
        br_if 0 (;@2;)
        local.get 1
        i32.const 2
        i32.and
        i32.eqz
        br_if 1 (;@1;)
        local.get 3
        local.get 3
        i32.load
        local.tee 1
        i32.sub
        local.tee 3
        i32.const 1048
        i32.load
        i32.lt_u
        br_if 1 (;@1;)
        local.get 0
        local.get 1
        i32.add
        local.set 0
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              i32.const 1052
              i32.load
              local.get 3
              i32.ne
              if  ;; label = @6
                local.get 3
                i32.load offset=12
                local.set 2
                local.get 1
                i32.const 255
                i32.le_u
                if  ;; label = @7
                  local.get 2
                  local.get 3
                  i32.load offset=8
                  local.tee 4
                  i32.ne
                  br_if 2 (;@5;)
                  i32.const 1032
                  i32.const 1032
                  i32.load
                  i32.const -2
                  local.get 1
                  i32.const 3
                  i32.shr_u
                  i32.rotl
                  i32.and
                  i32.store
                  br 5 (;@2;)
                end
                local.get 3
                i32.load offset=24
                local.set 6
                local.get 2
                local.get 3
                i32.ne
                if  ;; label = @7
                  local.get 3
                  i32.load offset=8
                  local.tee 1
                  local.get 2
                  i32.store offset=12
                  local.get 2
                  local.get 1
                  i32.store offset=8
                  br 4 (;@3;)
                end
                local.get 3
                i32.load offset=20
                local.tee 1
                if (result i32)  ;; label = @7
                  local.get 3
                  i32.const 20
                  i32.add
                else
                  local.get 3
                  i32.load offset=16
                  local.tee 1
                  i32.eqz
                  br_if 3 (;@4;)
                  local.get 3
                  i32.const 16
                  i32.add
                end
                local.set 4
                loop  ;; label = @7
                  local.get 4
                  local.set 7
                  local.get 1
                  local.tee 2
                  i32.const 20
                  i32.add
                  local.set 4
                  local.get 2
                  i32.load offset=20
                  local.tee 1
                  br_if 0 (;@7;)
                  local.get 2
                  i32.const 16
                  i32.add
                  local.set 4
                  local.get 2
                  i32.load offset=16
                  local.tee 1
                  br_if 0 (;@7;)
                end
                local.get 7
                i32.const 0
                i32.store
                br 3 (;@3;)
              end
              local.get 5
              i32.load offset=4
              local.tee 1
              i32.const 3
              i32.and
              i32.const 3
              i32.ne
              br_if 3 (;@2;)
              local.get 5
              local.get 1
              i32.const -2
              i32.and
              i32.store offset=4
              i32.const 1040
              local.get 0
              i32.store
              local.get 5
              local.get 0
              i32.store
              local.get 3
              local.get 0
              i32.const 1
              i32.or
              i32.store offset=4
              return
            end
            local.get 2
            local.get 4
            i32.store offset=8
            local.get 4
            local.get 2
            i32.store offset=12
            br 2 (;@2;)
          end
          i32.const 0
          local.set 2
        end
        local.get 6
        i32.eqz
        br_if 0 (;@2;)
        block  ;; label = @3
          local.get 3
          i32.load offset=28
          local.tee 1
          i32.const 2
          i32.shl
          i32.const 1336
          i32.add
          local.tee 4
          i32.load
          local.get 3
          i32.eq
          if  ;; label = @4
            local.get 4
            local.get 2
            i32.store
            local.get 2
            br_if 1 (;@3;)
            i32.const 1036
            i32.const 1036
            i32.load
            i32.const -2
            local.get 1
            i32.rotl
            i32.and
            i32.store
            br 2 (;@2;)
          end
          local.get 6
          i32.const 16
          i32.const 20
          local.get 6
          i32.load offset=16
          local.get 3
          i32.eq
          select
          i32.add
          local.get 2
          i32.store
          local.get 2
          i32.eqz
          br_if 1 (;@2;)
        end
        local.get 2
        local.get 6
        i32.store offset=24
        local.get 3
        i32.load offset=16
        local.tee 1
        if  ;; label = @3
          local.get 2
          local.get 1
          i32.store offset=16
          local.get 1
          local.get 2
          i32.store offset=24
        end
        local.get 3
        i32.load offset=20
        local.tee 1
        i32.eqz
        br_if 0 (;@2;)
        local.get 2
        local.get 1
        i32.store offset=20
        local.get 1
        local.get 2
        i32.store offset=24
      end
      local.get 3
      local.get 5
      i32.ge_u
      br_if 0 (;@1;)
      local.get 5
      i32.load offset=4
      local.tee 1
      i32.const 1
      i32.and
      i32.eqz
      br_if 0 (;@1;)
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              local.get 1
              i32.const 2
              i32.and
              i32.eqz
              if  ;; label = @6
                i32.const 1056
                i32.load
                local.get 5
                i32.eq
                if  ;; label = @7
                  i32.const 1056
                  local.get 3
                  i32.store
                  i32.const 1044
                  i32.const 1044
                  i32.load
                  local.get 0
                  i32.add
                  local.tee 0
                  i32.store
                  local.get 3
                  local.get 0
                  i32.const 1
                  i32.or
                  i32.store offset=4
                  local.get 3
                  i32.const 1052
                  i32.load
                  i32.ne
                  br_if 6 (;@1;)
                  i32.const 1040
                  i32.const 0
                  i32.store
                  i32.const 1052
                  i32.const 0
                  i32.store
                  return
                end
                i32.const 1052
                i32.load
                local.get 5
                i32.eq
                if  ;; label = @7
                  i32.const 1052
                  local.get 3
                  i32.store
                  i32.const 1040
                  i32.const 1040
                  i32.load
                  local.get 0
                  i32.add
                  local.tee 0
                  i32.store
                  local.get 3
                  local.get 0
                  i32.const 1
                  i32.or
                  i32.store offset=4
                  local.get 0
                  local.get 3
                  i32.add
                  local.get 0
                  i32.store
                  return
                end
                local.get 1
                i32.const -8
                i32.and
                local.get 0
                i32.add
                local.set 0
                local.get 5
                i32.load offset=12
                local.set 2
                local.get 1
                i32.const 255
                i32.le_u
                if  ;; label = @7
                  local.get 5
                  i32.load offset=8
                  local.tee 4
                  local.get 2
                  i32.eq
                  if  ;; label = @8
                    i32.const 1032
                    i32.const 1032
                    i32.load
                    i32.const -2
                    local.get 1
                    i32.const 3
                    i32.shr_u
                    i32.rotl
                    i32.and
                    i32.store
                    br 5 (;@3;)
                  end
                  local.get 2
                  local.get 4
                  i32.store offset=8
                  local.get 4
                  local.get 2
                  i32.store offset=12
                  br 4 (;@3;)
                end
                local.get 5
                i32.load offset=24
                local.set 6
                local.get 2
                local.get 5
                i32.ne
                if  ;; label = @7
                  local.get 5
                  i32.load offset=8
                  local.tee 1
                  local.get 2
                  i32.store offset=12
                  local.get 2
                  local.get 1
                  i32.store offset=8
                  br 3 (;@4;)
                end
                local.get 5
                i32.load offset=20
                local.tee 1
                if (result i32)  ;; label = @7
                  local.get 5
                  i32.const 20
                  i32.add
                else
                  local.get 5
                  i32.load offset=16
                  local.tee 1
                  i32.eqz
                  br_if 2 (;@5;)
                  local.get 5
                  i32.const 16
                  i32.add
                end
                local.set 4
                loop  ;; label = @7
                  local.get 4
                  local.set 7
                  local.get 1
                  local.tee 2
                  i32.const 20
                  i32.add
                  local.set 4
                  local.get 2
                  i32.load offset=20
                  local.tee 1
                  br_if 0 (;@7;)
                  local.get 2
                  i32.const 16
                  i32.add
                  local.set 4
                  local.get 2
                  i32.load offset=16
                  local.tee 1
                  br_if 0 (;@7;)
                end
                local.get 7
                i32.const 0
                i32.store
                br 2 (;@4;)
              end
              local.get 5
              local.get 1
              i32.const -2
              i32.and
              i32.store offset=4
              local.get 0
              local.get 3
              i32.add
              local.get 0
              i32.store
              local.get 3
              local.get 0
              i32.const 1
              i32.or
              i32.store offset=4
              br 3 (;@2;)
            end
            i32.const 0
            local.set 2
          end
          local.get 6
          i32.eqz
          br_if 0 (;@3;)
          block  ;; label = @4
            local.get 5
            i32.load offset=28
            local.tee 1
            i32.const 2
            i32.shl
            i32.const 1336
            i32.add
            local.tee 4
            i32.load
            local.get 5
            i32.eq
            if  ;; label = @5
              local.get 4
              local.get 2
              i32.store
              local.get 2
              br_if 1 (;@4;)
              i32.const 1036
              i32.const 1036
              i32.load
              i32.const -2
              local.get 1
              i32.rotl
              i32.and
              i32.store
              br 2 (;@3;)
            end
            local.get 6
            i32.const 16
            i32.const 20
            local.get 6
            i32.load offset=16
            local.get 5
            i32.eq
            select
            i32.add
            local.get 2
            i32.store
            local.get 2
            i32.eqz
            br_if 1 (;@3;)
          end
          local.get 2
          local.get 6
          i32.store offset=24
          local.get 5
          i32.load offset=16
          local.tee 1
          if  ;; label = @4
            local.get 2
            local.get 1
            i32.store offset=16
            local.get 1
            local.get 2
            i32.store offset=24
          end
          local.get 5
          i32.load offset=20
          local.tee 1
          i32.eqz
          br_if 0 (;@3;)
          local.get 2
          local.get 1
          i32.store offset=20
          local.get 1
          local.get 2
          i32.store offset=24
        end
        local.get 0
        local.get 3
        i32.add
        local.get 0
        i32.store
        local.get 3
        local.get 0
        i32.const 1
        i32.or
        i32.store offset=4
        local.get 3
        i32.const 1052
        i32.load
        i32.ne
        br_if 0 (;@2;)
        i32.const 1040
        local.get 0
        i32.store
        return
      end
      local.get 0
      i32.const 255
      i32.le_u
      if  ;; label = @2
        local.get 0
        i32.const -8
        i32.and
        i32.const 1072
        i32.add
        local.set 1
        block (result i32)  ;; label = @3
          i32.const 1032
          i32.load
          local.tee 4
          i32.const 1
          local.get 0
          i32.const 3
          i32.shr_u
          i32.shl
          local.tee 0
          i32.and
          i32.eqz
          if  ;; label = @4
            i32.const 1032
            local.get 0
            local.get 4
            i32.or
            i32.store
            local.get 1
            br 1 (;@3;)
          end
          local.get 1
          i32.load offset=8
        end
        local.tee 0
        local.get 3
        i32.store offset=12
        local.get 1
        local.get 3
        i32.store offset=8
        local.get 3
        local.get 1
        i32.store offset=12
        local.get 3
        local.get 0
        i32.store offset=8
        return
      end
      i32.const 31
      local.set 2
      local.get 0
      i32.const 16777215
      i32.le_u
      if  ;; label = @2
        local.get 0
        i32.const 38
        local.get 0
        i32.const 8
        i32.shr_u
        i32.clz
        local.tee 1
        i32.sub
        i32.shr_u
        i32.const 1
        i32.and
        local.get 1
        i32.const 1
        i32.shl
        i32.sub
        i32.const 62
        i32.add
        local.set 2
      end
      local.get 3
      local.get 2
      i32.store offset=28
      local.get 3
      i64.const 0
      i64.store offset=16 align=4
      local.get 2
      i32.const 2
      i32.shl
      i32.const 1336
      i32.add
      local.set 7
      block (result i32)  ;; label = @2
        block  ;; label = @3
          block (result i32)  ;; label = @4
            i32.const 1036
            i32.load
            local.tee 1
            i32.const 1
            local.get 2
            i32.shl
            local.tee 4
            i32.and
            i32.eqz
            if  ;; label = @5
              i32.const 1036
              local.get 1
              local.get 4
              i32.or
              i32.store
              i32.const 24
              local.set 2
              local.get 7
              local.set 4
              i32.const 8
              br 1 (;@4;)
            end
            local.get 0
            i32.const 0
            i32.const 25
            local.get 2
            i32.const 1
            i32.shr_u
            i32.sub
            local.get 2
            i32.const 31
            i32.eq
            select
            i32.shl
            local.set 2
            local.get 7
            i32.load
            local.set 4
            loop  ;; label = @5
              local.get 4
              local.tee 1
              i32.load offset=4
              i32.const -8
              i32.and
              local.get 0
              i32.eq
              br_if 2 (;@3;)
              local.get 2
              i32.const 29
              i32.shr_u
              local.set 4
              local.get 2
              i32.const 1
              i32.shl
              local.set 2
              local.get 1
              local.get 4
              i32.const 4
              i32.and
              i32.add
              i32.const 16
              i32.add
              local.tee 7
              i32.load
              local.tee 4
              br_if 0 (;@5;)
            end
            i32.const 24
            local.set 2
            local.get 1
            local.set 4
            i32.const 8
          end
          local.set 0
          local.get 3
          local.tee 1
          br 1 (;@2;)
        end
        local.get 1
        i32.load offset=8
        local.tee 4
        local.get 3
        i32.store offset=12
        i32.const 8
        local.set 2
        local.get 1
        i32.const 8
        i32.add
        local.set 7
        i32.const 24
        local.set 0
        i32.const 0
      end
      local.set 5
      local.get 7
      local.get 3
      i32.store
      local.get 2
      local.get 3
      i32.add
      local.get 4
      i32.store
      local.get 3
      local.get 1
      i32.store offset=12
      local.get 0
      local.get 3
      i32.add
      local.get 5
      i32.store
      i32.const 1064
      i32.const 1064
      i32.load
      i32.const 1
      i32.sub
      local.tee 0
      i32.const -1
      local.get 0
      select
      i32.store
    end)
  (func (;68;) (type 0) (param i32 i32) (result i32)
    (local i32 i64)
    block  ;; label = @1
      block (result i32)  ;; label = @2
        i32.const 0
        local.get 0
        i32.eqz
        br_if 0 (;@2;)
        drop
        local.get 0
        i64.extend_i32_u
        local.get 1
        i64.extend_i32_u
        i64.mul
        local.tee 3
        i32.wrap_i64
        local.tee 2
        local.get 0
        local.get 1
        i32.or
        i32.const 65536
        i32.lt_u
        br_if 0 (;@2;)
        drop
        i32.const -1
        local.get 2
        local.get 3
        i64.const 32
        i64.shr_u
        i32.wrap_i64
        select
      end
      local.tee 2
      call 65
      local.tee 0
      i32.eqz
      br_if 0 (;@1;)
      local.get 0
      i32.const 4
      i32.sub
      i32.load8_u
      i32.const 3
      i32.and
      i32.eqz
      br_if 0 (;@1;)
      local.get 0
      i32.const 0
      local.get 2
      call 78
      drop
    end
    local.get 0)
  (func (;69;) (type 0) (param i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    local.get 0
    i32.eqz
    if  ;; label = @1
      local.get 1
      call 65
      return
    end
    local.get 1
    i32.const -64
    i32.ge_u
    if  ;; label = @1
      i32.const 1528
      i32.const 48
      i32.store
      i32.const 0
      return
    end
    i32.const 16
    local.get 1
    i32.const 19
    i32.add
    i32.const -16
    i32.and
    local.get 1
    i32.const 11
    i32.lt_u
    select
    local.set 3
    local.get 0
    i32.const 4
    i32.sub
    local.tee 7
    i32.load
    local.tee 8
    i32.const -8
    i32.and
    local.set 2
    block  ;; label = @1
      block  ;; label = @2
        local.get 8
        i32.const 3
        i32.and
        i32.eqz
        if  ;; label = @3
          local.get 3
          i32.const 256
          i32.lt_u
          br_if 1 (;@2;)
          local.get 2
          local.get 3
          i32.const 4
          i32.or
          i32.lt_u
          br_if 1 (;@2;)
          local.get 2
          local.get 3
          i32.sub
          i32.const 1512
          i32.load
          i32.const 1
          i32.shl
          i32.le_u
          br_if 2 (;@1;)
          br 1 (;@2;)
        end
        local.get 0
        i32.const 8
        i32.sub
        local.tee 6
        local.get 2
        i32.add
        local.set 4
        local.get 2
        local.get 3
        i32.ge_u
        if  ;; label = @3
          local.get 2
          local.get 3
          i32.sub
          local.tee 1
          i32.const 16
          i32.lt_u
          br_if 2 (;@1;)
          local.get 7
          local.get 3
          local.get 8
          i32.const 1
          i32.and
          i32.or
          i32.const 2
          i32.or
          i32.store
          local.get 3
          local.get 6
          i32.add
          local.tee 2
          local.get 1
          i32.const 3
          i32.or
          i32.store offset=4
          local.get 4
          local.get 4
          i32.load offset=4
          i32.const 1
          i32.or
          i32.store offset=4
          local.get 2
          local.get 1
          call 70
          local.get 0
          return
        end
        i32.const 1056
        i32.load
        local.get 4
        i32.eq
        if  ;; label = @3
          i32.const 1044
          i32.load
          local.get 2
          i32.add
          local.tee 2
          local.get 3
          i32.le_u
          br_if 1 (;@2;)
          local.get 7
          local.get 3
          local.get 8
          i32.const 1
          i32.and
          i32.or
          i32.const 2
          i32.or
          i32.store
          i32.const 1056
          local.get 3
          local.get 6
          i32.add
          local.tee 1
          i32.store
          i32.const 1044
          local.get 2
          local.get 3
          i32.sub
          local.tee 2
          i32.store
          local.get 1
          local.get 2
          i32.const 1
          i32.or
          i32.store offset=4
          local.get 0
          return
        end
        i32.const 1052
        i32.load
        local.get 4
        i32.eq
        if  ;; label = @3
          i32.const 1040
          i32.load
          local.get 2
          i32.add
          local.tee 2
          local.get 3
          i32.lt_u
          br_if 1 (;@2;)
          block  ;; label = @4
            local.get 2
            local.get 3
            i32.sub
            local.tee 1
            i32.const 16
            i32.ge_u
            if  ;; label = @5
              local.get 7
              local.get 3
              local.get 8
              i32.const 1
              i32.and
              i32.or
              i32.const 2
              i32.or
              i32.store
              local.get 3
              local.get 6
              i32.add
              local.tee 5
              local.get 1
              i32.const 1
              i32.or
              i32.store offset=4
              local.get 2
              local.get 6
              i32.add
              local.tee 2
              local.get 1
              i32.store
              local.get 2
              local.get 2
              i32.load offset=4
              i32.const -2
              i32.and
              i32.store offset=4
              br 1 (;@4;)
            end
            local.get 7
            local.get 8
            i32.const 1
            i32.and
            local.get 2
            i32.or
            i32.const 2
            i32.or
            i32.store
            local.get 2
            local.get 6
            i32.add
            local.tee 1
            local.get 1
            i32.load offset=4
            i32.const 1
            i32.or
            i32.store offset=4
            i32.const 0
            local.set 1
          end
          i32.const 1052
          local.get 5
          i32.store
          i32.const 1040
          local.get 1
          i32.store
          local.get 0
          return
        end
        local.get 4
        i32.load offset=4
        local.tee 5
        i32.const 2
        i32.and
        br_if 0 (;@2;)
        local.get 5
        i32.const -8
        i32.and
        local.get 2
        i32.add
        local.tee 9
        local.get 3
        i32.lt_u
        br_if 0 (;@2;)
        local.get 9
        local.get 3
        i32.sub
        local.set 11
        local.get 4
        i32.load offset=12
        local.set 1
        block  ;; label = @3
          local.get 5
          i32.const 255
          i32.le_u
          if  ;; label = @4
            local.get 4
            i32.load offset=8
            local.tee 2
            local.get 1
            i32.eq
            if  ;; label = @5
              i32.const 1032
              i32.const 1032
              i32.load
              i32.const -2
              local.get 5
              i32.const 3
              i32.shr_u
              i32.rotl
              i32.and
              i32.store
              br 2 (;@3;)
            end
            local.get 1
            local.get 2
            i32.store offset=8
            local.get 2
            local.get 1
            i32.store offset=12
            br 1 (;@3;)
          end
          local.get 4
          i32.load offset=24
          local.set 10
          block  ;; label = @4
            local.get 1
            local.get 4
            i32.ne
            if  ;; label = @5
              local.get 4
              i32.load offset=8
              local.tee 2
              local.get 1
              i32.store offset=12
              local.get 1
              local.get 2
              i32.store offset=8
              br 1 (;@4;)
            end
            block  ;; label = @5
              local.get 4
              i32.load offset=20
              local.tee 2
              if (result i32)  ;; label = @6
                local.get 4
                i32.const 20
                i32.add
              else
                local.get 4
                i32.load offset=16
                local.tee 2
                i32.eqz
                br_if 1 (;@5;)
                local.get 4
                i32.const 16
                i32.add
              end
              local.set 5
              loop  ;; label = @6
                local.get 5
                local.set 12
                local.get 2
                local.tee 1
                i32.const 20
                i32.add
                local.set 5
                local.get 1
                i32.load offset=20
                local.tee 2
                br_if 0 (;@6;)
                local.get 1
                i32.const 16
                i32.add
                local.set 5
                local.get 1
                i32.load offset=16
                local.tee 2
                br_if 0 (;@6;)
              end
              local.get 12
              i32.const 0
              i32.store
              br 1 (;@4;)
            end
            i32.const 0
            local.set 1
          end
          local.get 10
          i32.eqz
          br_if 0 (;@3;)
          block  ;; label = @4
            local.get 4
            i32.load offset=28
            local.tee 2
            i32.const 2
            i32.shl
            i32.const 1336
            i32.add
            local.tee 5
            i32.load
            local.get 4
            i32.eq
            if  ;; label = @5
              local.get 5
              local.get 1
              i32.store
              local.get 1
              br_if 1 (;@4;)
              i32.const 1036
              i32.const 1036
              i32.load
              i32.const -2
              local.get 2
              i32.rotl
              i32.and
              i32.store
              br 2 (;@3;)
            end
            local.get 10
            i32.const 16
            i32.const 20
            local.get 10
            i32.load offset=16
            local.get 4
            i32.eq
            select
            i32.add
            local.get 1
            i32.store
            local.get 1
            i32.eqz
            br_if 1 (;@3;)
          end
          local.get 1
          local.get 10
          i32.store offset=24
          local.get 4
          i32.load offset=16
          local.tee 2
          if  ;; label = @4
            local.get 1
            local.get 2
            i32.store offset=16
            local.get 2
            local.get 1
            i32.store offset=24
          end
          local.get 4
          i32.load offset=20
          local.tee 2
          i32.eqz
          br_if 0 (;@3;)
          local.get 1
          local.get 2
          i32.store offset=20
          local.get 2
          local.get 1
          i32.store offset=24
        end
        local.get 11
        i32.const 15
        i32.le_u
        if  ;; label = @3
          local.get 7
          local.get 8
          i32.const 1
          i32.and
          local.get 9
          i32.or
          i32.const 2
          i32.or
          i32.store
          local.get 6
          local.get 9
          i32.add
          local.tee 1
          local.get 1
          i32.load offset=4
          i32.const 1
          i32.or
          i32.store offset=4
          local.get 0
          return
        end
        local.get 7
        local.get 3
        local.get 8
        i32.const 1
        i32.and
        i32.or
        i32.const 2
        i32.or
        i32.store
        local.get 3
        local.get 6
        i32.add
        local.tee 1
        local.get 11
        i32.const 3
        i32.or
        i32.store offset=4
        local.get 6
        local.get 9
        i32.add
        local.tee 2
        local.get 2
        i32.load offset=4
        i32.const 1
        i32.or
        i32.store offset=4
        local.get 1
        local.get 11
        call 70
        local.get 0
        return
      end
      local.get 1
      call 65
      local.tee 2
      i32.eqz
      if  ;; label = @2
        i32.const 0
        return
      end
      local.get 2
      local.get 0
      i32.const -4
      i32.const -8
      local.get 7
      i32.load
      local.tee 2
      i32.const 3
      i32.and
      select
      local.get 2
      i32.const -8
      i32.and
      i32.add
      local.tee 2
      local.get 1
      local.get 1
      local.get 2
      i32.gt_u
      select
      call 77
      local.set 1
      local.get 0
      call 67
      local.get 1
      local.set 0
    end
    local.get 0)
  (func (;70;) (type 10) (param i32 i32)
    (local i32 i32 i32 i32 i32 i32)
    local.get 0
    local.get 1
    i32.add
    local.set 5
    block  ;; label = @1
      block  ;; label = @2
        local.get 0
        i32.load offset=4
        local.tee 2
        i32.const 1
        i32.and
        br_if 0 (;@2;)
        local.get 2
        i32.const 2
        i32.and
        i32.eqz
        br_if 1 (;@1;)
        local.get 0
        i32.load
        local.tee 2
        local.get 1
        i32.add
        local.set 1
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              local.get 0
              local.get 2
              i32.sub
              local.tee 0
              i32.const 1052
              i32.load
              i32.ne
              if  ;; label = @6
                local.get 0
                i32.load offset=12
                local.set 3
                local.get 2
                i32.const 255
                i32.le_u
                if  ;; label = @7
                  local.get 3
                  local.get 0
                  i32.load offset=8
                  local.tee 4
                  i32.ne
                  br_if 2 (;@5;)
                  i32.const 1032
                  i32.const 1032
                  i32.load
                  i32.const -2
                  local.get 2
                  i32.const 3
                  i32.shr_u
                  i32.rotl
                  i32.and
                  i32.store
                  br 5 (;@2;)
                end
                local.get 0
                i32.load offset=24
                local.set 6
                local.get 0
                local.get 3
                i32.ne
                if  ;; label = @7
                  local.get 0
                  i32.load offset=8
                  local.tee 2
                  local.get 3
                  i32.store offset=12
                  local.get 3
                  local.get 2
                  i32.store offset=8
                  br 4 (;@3;)
                end
                local.get 0
                i32.load offset=20
                local.tee 4
                if (result i32)  ;; label = @7
                  local.get 0
                  i32.const 20
                  i32.add
                else
                  local.get 0
                  i32.load offset=16
                  local.tee 4
                  i32.eqz
                  br_if 3 (;@4;)
                  local.get 0
                  i32.const 16
                  i32.add
                end
                local.set 2
                loop  ;; label = @7
                  local.get 2
                  local.set 7
                  local.get 4
                  local.tee 3
                  i32.const 20
                  i32.add
                  local.set 2
                  local.get 3
                  i32.load offset=20
                  local.tee 4
                  br_if 0 (;@7;)
                  local.get 3
                  i32.const 16
                  i32.add
                  local.set 2
                  local.get 3
                  i32.load offset=16
                  local.tee 4
                  br_if 0 (;@7;)
                end
                local.get 7
                i32.const 0
                i32.store
                br 3 (;@3;)
              end
              local.get 5
              i32.load offset=4
              local.tee 2
              i32.const 3
              i32.and
              i32.const 3
              i32.ne
              br_if 3 (;@2;)
              local.get 5
              local.get 2
              i32.const -2
              i32.and
              i32.store offset=4
              i32.const 1040
              local.get 1
              i32.store
              local.get 5
              local.get 1
              i32.store
              local.get 0
              local.get 1
              i32.const 1
              i32.or
              i32.store offset=4
              return
            end
            local.get 3
            local.get 4
            i32.store offset=8
            local.get 4
            local.get 3
            i32.store offset=12
            br 2 (;@2;)
          end
          i32.const 0
          local.set 3
        end
        local.get 6
        i32.eqz
        br_if 0 (;@2;)
        block  ;; label = @3
          local.get 0
          i32.load offset=28
          local.tee 2
          i32.const 2
          i32.shl
          i32.const 1336
          i32.add
          local.tee 4
          i32.load
          local.get 0
          i32.eq
          if  ;; label = @4
            local.get 4
            local.get 3
            i32.store
            local.get 3
            br_if 1 (;@3;)
            i32.const 1036
            i32.const 1036
            i32.load
            i32.const -2
            local.get 2
            i32.rotl
            i32.and
            i32.store
            br 2 (;@2;)
          end
          local.get 6
          i32.const 16
          i32.const 20
          local.get 6
          i32.load offset=16
          local.get 0
          i32.eq
          select
          i32.add
          local.get 3
          i32.store
          local.get 3
          i32.eqz
          br_if 1 (;@2;)
        end
        local.get 3
        local.get 6
        i32.store offset=24
        local.get 0
        i32.load offset=16
        local.tee 2
        if  ;; label = @3
          local.get 3
          local.get 2
          i32.store offset=16
          local.get 2
          local.get 3
          i32.store offset=24
        end
        local.get 0
        i32.load offset=20
        local.tee 2
        i32.eqz
        br_if 0 (;@2;)
        local.get 3
        local.get 2
        i32.store offset=20
        local.get 2
        local.get 3
        i32.store offset=24
      end
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              local.get 5
              i32.load offset=4
              local.tee 2
              i32.const 2
              i32.and
              i32.eqz
              if  ;; label = @6
                i32.const 1056
                i32.load
                local.get 5
                i32.eq
                if  ;; label = @7
                  i32.const 1056
                  local.get 0
                  i32.store
                  i32.const 1044
                  i32.const 1044
                  i32.load
                  local.get 1
                  i32.add
                  local.tee 1
                  i32.store
                  local.get 0
                  local.get 1
                  i32.const 1
                  i32.or
                  i32.store offset=4
                  local.get 0
                  i32.const 1052
                  i32.load
                  i32.ne
                  br_if 6 (;@1;)
                  i32.const 1040
                  i32.const 0
                  i32.store
                  i32.const 1052
                  i32.const 0
                  i32.store
                  return
                end
                i32.const 1052
                i32.load
                local.get 5
                i32.eq
                if  ;; label = @7
                  i32.const 1052
                  local.get 0
                  i32.store
                  i32.const 1040
                  i32.const 1040
                  i32.load
                  local.get 1
                  i32.add
                  local.tee 1
                  i32.store
                  local.get 0
                  local.get 1
                  i32.const 1
                  i32.or
                  i32.store offset=4
                  local.get 0
                  local.get 1
                  i32.add
                  local.get 1
                  i32.store
                  return
                end
                local.get 2
                i32.const -8
                i32.and
                local.get 1
                i32.add
                local.set 1
                local.get 5
                i32.load offset=12
                local.set 3
                local.get 2
                i32.const 255
                i32.le_u
                if  ;; label = @7
                  local.get 5
                  i32.load offset=8
                  local.tee 4
                  local.get 3
                  i32.eq
                  if  ;; label = @8
                    i32.const 1032
                    i32.const 1032
                    i32.load
                    i32.const -2
                    local.get 2
                    i32.const 3
                    i32.shr_u
                    i32.rotl
                    i32.and
                    i32.store
                    br 5 (;@3;)
                  end
                  local.get 3
                  local.get 4
                  i32.store offset=8
                  local.get 4
                  local.get 3
                  i32.store offset=12
                  br 4 (;@3;)
                end
                local.get 5
                i32.load offset=24
                local.set 6
                local.get 3
                local.get 5
                i32.ne
                if  ;; label = @7
                  local.get 5
                  i32.load offset=8
                  local.tee 2
                  local.get 3
                  i32.store offset=12
                  local.get 3
                  local.get 2
                  i32.store offset=8
                  br 3 (;@4;)
                end
                local.get 5
                i32.load offset=20
                local.tee 4
                if (result i32)  ;; label = @7
                  local.get 5
                  i32.const 20
                  i32.add
                else
                  local.get 5
                  i32.load offset=16
                  local.tee 4
                  i32.eqz
                  br_if 2 (;@5;)
                  local.get 5
                  i32.const 16
                  i32.add
                end
                local.set 2
                loop  ;; label = @7
                  local.get 2
                  local.set 7
                  local.get 4
                  local.tee 3
                  i32.const 20
                  i32.add
                  local.set 2
                  local.get 3
                  i32.load offset=20
                  local.tee 4
                  br_if 0 (;@7;)
                  local.get 3
                  i32.const 16
                  i32.add
                  local.set 2
                  local.get 3
                  i32.load offset=16
                  local.tee 4
                  br_if 0 (;@7;)
                end
                local.get 7
                i32.const 0
                i32.store
                br 2 (;@4;)
              end
              local.get 5
              local.get 2
              i32.const -2
              i32.and
              i32.store offset=4
              local.get 0
              local.get 1
              i32.add
              local.get 1
              i32.store
              local.get 0
              local.get 1
              i32.const 1
              i32.or
              i32.store offset=4
              br 3 (;@2;)
            end
            i32.const 0
            local.set 3
          end
          local.get 6
          i32.eqz
          br_if 0 (;@3;)
          block  ;; label = @4
            local.get 5
            i32.load offset=28
            local.tee 2
            i32.const 2
            i32.shl
            i32.const 1336
            i32.add
            local.tee 4
            i32.load
            local.get 5
            i32.eq
            if  ;; label = @5
              local.get 4
              local.get 3
              i32.store
              local.get 3
              br_if 1 (;@4;)
              i32.const 1036
              i32.const 1036
              i32.load
              i32.const -2
              local.get 2
              i32.rotl
              i32.and
              i32.store
              br 2 (;@3;)
            end
            local.get 6
            i32.const 16
            i32.const 20
            local.get 6
            i32.load offset=16
            local.get 5
            i32.eq
            select
            i32.add
            local.get 3
            i32.store
            local.get 3
            i32.eqz
            br_if 1 (;@3;)
          end
          local.get 3
          local.get 6
          i32.store offset=24
          local.get 5
          i32.load offset=16
          local.tee 2
          if  ;; label = @4
            local.get 3
            local.get 2
            i32.store offset=16
            local.get 2
            local.get 3
            i32.store offset=24
          end
          local.get 5
          i32.load offset=20
          local.tee 2
          i32.eqz
          br_if 0 (;@3;)
          local.get 3
          local.get 2
          i32.store offset=20
          local.get 2
          local.get 3
          i32.store offset=24
        end
        local.get 0
        local.get 1
        i32.add
        local.get 1
        i32.store
        local.get 0
        local.get 1
        i32.const 1
        i32.or
        i32.store offset=4
        local.get 0
        i32.const 1052
        i32.load
        i32.ne
        br_if 0 (;@2;)
        i32.const 1040
        local.get 1
        i32.store
        return
      end
      local.get 1
      i32.const 255
      i32.le_u
      if  ;; label = @2
        local.get 1
        i32.const -8
        i32.and
        i32.const 1072
        i32.add
        local.set 2
        block (result i32)  ;; label = @3
          i32.const 1032
          i32.load
          local.tee 3
          i32.const 1
          local.get 1
          i32.const 3
          i32.shr_u
          i32.shl
          local.tee 1
          i32.and
          i32.eqz
          if  ;; label = @4
            i32.const 1032
            local.get 1
            local.get 3
            i32.or
            i32.store
            local.get 2
            br 1 (;@3;)
          end
          local.get 2
          i32.load offset=8
        end
        local.tee 1
        local.get 0
        i32.store offset=12
        local.get 2
        local.get 0
        i32.store offset=8
        local.get 0
        local.get 2
        i32.store offset=12
        local.get 0
        local.get 1
        i32.store offset=8
        return
      end
      i32.const 31
      local.set 3
      local.get 1
      i32.const 16777215
      i32.le_u
      if  ;; label = @2
        local.get 1
        i32.const 38
        local.get 1
        i32.const 8
        i32.shr_u
        i32.clz
        local.tee 2
        i32.sub
        i32.shr_u
        i32.const 1
        i32.and
        local.get 2
        i32.const 1
        i32.shl
        i32.sub
        i32.const 62
        i32.add
        local.set 3
      end
      local.get 0
      local.get 3
      i32.store offset=28
      local.get 0
      i64.const 0
      i64.store offset=16 align=4
      local.get 3
      i32.const 2
      i32.shl
      i32.const 1336
      i32.add
      local.set 2
      i32.const 1036
      i32.load
      local.tee 4
      i32.const 1
      local.get 3
      i32.shl
      local.tee 7
      i32.and
      i32.eqz
      if  ;; label = @2
        local.get 2
        local.get 0
        i32.store
        i32.const 1036
        local.get 4
        local.get 7
        i32.or
        i32.store
        local.get 0
        local.get 2
        i32.store offset=24
        local.get 0
        local.get 0
        i32.store offset=8
        local.get 0
        local.get 0
        i32.store offset=12
        return
      end
      local.get 1
      i32.const 0
      i32.const 25
      local.get 3
      i32.const 1
      i32.shr_u
      i32.sub
      local.get 3
      i32.const 31
      i32.eq
      select
      i32.shl
      local.set 3
      local.get 2
      i32.load
      local.set 2
      block  ;; label = @2
        loop  ;; label = @3
          local.get 2
          local.tee 4
          i32.load offset=4
          i32.const -8
          i32.and
          local.get 1
          i32.eq
          br_if 1 (;@2;)
          local.get 3
          i32.const 29
          i32.shr_u
          local.set 2
          local.get 3
          i32.const 1
          i32.shl
          local.set 3
          local.get 4
          local.get 2
          i32.const 4
          i32.and
          i32.add
          i32.const 16
          i32.add
          local.tee 7
          i32.load
          local.tee 2
          br_if 0 (;@3;)
        end
        local.get 7
        local.get 0
        i32.store
        local.get 0
        local.get 4
        i32.store offset=24
        local.get 0
        local.get 0
        i32.store offset=12
        local.get 0
        local.get 0
        i32.store offset=8
        return
      end
      local.get 4
      i32.load offset=8
      local.tee 1
      local.get 0
      i32.store offset=12
      local.get 4
      local.get 0
      i32.store offset=8
      local.get 0
      i32.const 0
      i32.store offset=24
      local.get 0
      local.get 4
      i32.store offset=12
      local.get 0
      local.get 1
      i32.store offset=8
    end)
  (func (;71;) (type 1) (param i32 i32 i32) (result i32)
    (local i32 i32)
    block  ;; label = @1
      block (result i32)  ;; label = @2
        local.get 1
        i32.const 16
        i32.eq
        if  ;; label = @3
          local.get 2
          call 65
          br 1 (;@2;)
        end
        i32.const 28
        local.set 3
        local.get 1
        i32.const 4
        i32.lt_u
        br_if 1 (;@1;)
        local.get 1
        i32.const 3
        i32.and
        br_if 1 (;@1;)
        local.get 1
        i32.const 2
        i32.shr_u
        local.tee 4
        local.get 4
        i32.const 1
        i32.sub
        i32.and
        br_if 1 (;@1;)
        local.get 2
        i32.const -64
        local.get 1
        i32.sub
        i32.gt_u
        if  ;; label = @3
          i32.const 48
          return
        end
        local.get 1
        i32.const 16
        local.get 1
        i32.const 16
        i32.gt_u
        select
        local.get 2
        call 72
      end
      local.tee 1
      i32.eqz
      if  ;; label = @2
        i32.const 48
        return
      end
      local.get 0
      local.get 1
      i32.store
      i32.const 0
      local.set 3
    end
    local.get 3)
  (func (;72;) (type 0) (param i32 i32) (result i32)
    (local i32 i32 i32 i32 i32)
    block  ;; label = @1
      local.get 0
      i32.const 16
      local.get 0
      i32.const 16
      i32.gt_u
      select
      local.tee 3
      local.get 3
      i32.const 1
      i32.sub
      i32.and
      i32.eqz
      if  ;; label = @2
        local.get 3
        local.set 0
        br 1 (;@1;)
      end
      i32.const 32
      local.set 2
      loop  ;; label = @2
        local.get 2
        local.tee 0
        i32.const 1
        i32.shl
        local.set 2
        local.get 0
        local.get 3
        i32.lt_u
        br_if 0 (;@2;)
      end
    end
    local.get 1
    i32.const -64
    local.get 0
    i32.sub
    i32.ge_u
    if  ;; label = @1
      i32.const 1528
      i32.const 48
      i32.store
      i32.const 0
      return
    end
    local.get 0
    i32.const 16
    local.get 1
    i32.const 19
    i32.add
    i32.const -16
    i32.and
    local.get 1
    i32.const 11
    i32.lt_u
    select
    local.tee 3
    i32.add
    i32.const 12
    i32.add
    call 65
    local.tee 2
    i32.eqz
    if  ;; label = @1
      i32.const 0
      return
    end
    local.get 2
    i32.const 8
    i32.sub
    local.set 1
    block  ;; label = @1
      local.get 0
      i32.const 1
      i32.sub
      local.get 2
      i32.and
      i32.eqz
      if  ;; label = @2
        local.get 1
        local.set 0
        br 1 (;@1;)
      end
      local.get 2
      i32.const 4
      i32.sub
      local.tee 5
      i32.load
      local.tee 6
      i32.const -8
      i32.and
      local.get 0
      local.get 2
      i32.add
      i32.const 1
      i32.sub
      i32.const 0
      local.get 0
      i32.sub
      i32.and
      i32.const 8
      i32.sub
      local.tee 2
      i32.const 0
      local.get 0
      local.get 2
      local.get 1
      i32.sub
      i32.const 15
      i32.gt_u
      select
      i32.add
      local.tee 0
      local.get 1
      i32.sub
      local.tee 2
      i32.sub
      local.set 4
      local.get 6
      i32.const 3
      i32.and
      i32.eqz
      if  ;; label = @2
        local.get 0
        local.get 4
        i32.store offset=4
        local.get 0
        local.get 1
        i32.load
        local.get 2
        i32.add
        i32.store
        br 1 (;@1;)
      end
      local.get 0
      local.get 4
      local.get 0
      i32.load offset=4
      i32.const 1
      i32.and
      i32.or
      i32.const 2
      i32.or
      i32.store offset=4
      local.get 0
      local.get 4
      i32.add
      local.tee 4
      local.get 4
      i32.load offset=4
      i32.const 1
      i32.or
      i32.store offset=4
      local.get 5
      local.get 2
      local.get 5
      i32.load
      i32.const 1
      i32.and
      i32.or
      i32.const 2
      i32.or
      i32.store
      local.get 1
      local.get 2
      i32.add
      local.tee 4
      local.get 4
      i32.load offset=4
      i32.const 1
      i32.or
      i32.store offset=4
      local.get 1
      local.get 2
      call 70
    end
    block  ;; label = @1
      local.get 0
      i32.load offset=4
      local.tee 1
      i32.const 3
      i32.and
      i32.eqz
      br_if 0 (;@1;)
      local.get 1
      i32.const -8
      i32.and
      local.tee 2
      local.get 3
      i32.const 16
      i32.add
      i32.le_u
      br_if 0 (;@1;)
      local.get 0
      local.get 3
      local.get 1
      i32.const 1
      i32.and
      i32.or
      i32.const 2
      i32.or
      i32.store offset=4
      local.get 0
      local.get 3
      i32.add
      local.tee 1
      local.get 2
      local.get 3
      i32.sub
      local.tee 3
      i32.const 3
      i32.or
      i32.store offset=4
      local.get 0
      local.get 2
      i32.add
      local.tee 2
      local.get 2
      i32.load offset=4
      i32.const 1
      i32.or
      i32.store offset=4
      local.get 1
      local.get 3
      call 70
    end
    local.get 0
    i32.const 8
    i32.add)
  (func (;73;) (type 0) (param i32 i32) (result i32)
    local.get 0
    i32.const 16
    i32.le_u
    if  ;; label = @1
      local.get 1
      call 65
      return
    end
    local.get 0
    local.get 1
    call 72)
  (func (;74;) (type 3) (param i32) (result i32)
    (local i32)
    block  ;; label = @1
      local.get 0
      i32.eqz
      br_if 0 (;@1;)
      local.get 0
      i32.const 4
      i32.sub
      i32.load
      local.tee 0
      i32.const 3
      i32.and
      local.tee 1
      i32.const 1
      i32.eq
      br_if 0 (;@1;)
      local.get 0
      i32.const -8
      i32.and
      i32.const -4
      i32.const -8
      local.get 1
      select
      i32.add
      return
    end
    i32.const 0)
  (func (;75;) (type 16)
    unreachable)
  (func (;76;) (type 3) (param i32) (result i32)
    local.get 0
    i32.eqz
    if  ;; label = @1
      memory.size
      i32.const 16
      i32.shl
      return
    end
    block  ;; label = @1
      local.get 0
      i32.const 65535
      i32.and
      br_if 0 (;@1;)
      local.get 0
      i32.const 0
      i32.lt_s
      br_if 0 (;@1;)
      local.get 0
      i32.const 16
      i32.shr_u
      memory.grow
      local.tee 0
      i32.const -1
      i32.eq
      if  ;; label = @2
        i32.const 1528
        i32.const 48
        i32.store
        i32.const -1
        return
      end
      local.get 0
      i32.const 16
      i32.shl
      return
    end
    unreachable)
  (func (;77;) (type 1) (param i32 i32 i32) (result i32)
    (local i32 i32 i32 i32)
    block  ;; label = @1
      block  ;; label = @2
        local.get 2
        i32.const 32
        i32.le_u
        if  ;; label = @3
          local.get 1
          i32.const 3
          i32.and
          i32.eqz
          br_if 1 (;@2;)
          local.get 2
          i32.eqz
          br_if 1 (;@2;)
          local.get 0
          local.get 1
          i32.load8_u
          i32.store8
          local.get 2
          i32.const 1
          i32.sub
          local.set 5
          local.get 0
          i32.const 1
          i32.add
          local.set 4
          local.get 1
          i32.const 1
          i32.add
          local.tee 3
          i32.const 3
          i32.and
          i32.eqz
          br_if 2 (;@1;)
          local.get 5
          i32.eqz
          br_if 2 (;@1;)
          local.get 0
          local.get 1
          i32.load8_u offset=1
          i32.store8 offset=1
          local.get 2
          i32.const 2
          i32.sub
          local.set 5
          local.get 0
          i32.const 2
          i32.add
          local.set 4
          local.get 1
          i32.const 2
          i32.add
          local.tee 3
          i32.const 3
          i32.and
          i32.eqz
          br_if 2 (;@1;)
          local.get 5
          i32.eqz
          br_if 2 (;@1;)
          local.get 0
          local.get 1
          i32.load8_u offset=2
          i32.store8 offset=2
          local.get 2
          i32.const 3
          i32.sub
          local.set 5
          local.get 0
          i32.const 3
          i32.add
          local.set 4
          local.get 1
          i32.const 3
          i32.add
          local.tee 3
          i32.const 3
          i32.and
          i32.eqz
          br_if 2 (;@1;)
          local.get 5
          i32.eqz
          br_if 2 (;@1;)
          local.get 0
          local.get 1
          i32.load8_u offset=3
          i32.store8 offset=3
          local.get 2
          i32.const 4
          i32.sub
          local.set 5
          local.get 0
          i32.const 4
          i32.add
          local.set 4
          local.get 1
          i32.const 4
          i32.add
          local.set 3
          br 2 (;@1;)
        end
        local.get 0
        local.get 1
        local.get 2
        memory.copy
        local.get 0
        return
      end
      local.get 2
      local.set 5
      local.get 0
      local.set 4
      local.get 1
      local.set 3
    end
    block  ;; label = @1
      local.get 4
      i32.const 3
      i32.and
      local.tee 2
      i32.eqz
      if  ;; label = @2
        block  ;; label = @3
          local.get 5
          i32.const 16
          i32.lt_u
          if  ;; label = @4
            local.get 5
            local.set 2
            br 1 (;@3;)
          end
          local.get 5
          i32.const 16
          i32.sub
          local.tee 2
          i32.const 16
          i32.and
          i32.eqz
          if  ;; label = @4
            local.get 4
            local.get 3
            i64.load align=4
            i64.store align=4
            local.get 4
            local.get 3
            i64.load offset=8 align=4
            i64.store offset=8 align=4
            local.get 4
            i32.const 16
            i32.add
            local.set 4
            local.get 3
            i32.const 16
            i32.add
            local.set 3
            local.get 2
            local.set 5
          end
          local.get 2
          i32.const 16
          i32.lt_u
          br_if 0 (;@3;)
          local.get 5
          local.set 2
          loop  ;; label = @4
            local.get 4
            local.get 3
            i64.load align=4
            i64.store align=4
            local.get 4
            local.get 3
            i64.load offset=8 align=4
            i64.store offset=8 align=4
            local.get 4
            local.get 3
            i64.load offset=16 align=4
            i64.store offset=16 align=4
            local.get 4
            local.get 3
            i64.load offset=24 align=4
            i64.store offset=24 align=4
            local.get 4
            i32.const 32
            i32.add
            local.set 4
            local.get 3
            i32.const 32
            i32.add
            local.set 3
            local.get 2
            i32.const 32
            i32.sub
            local.tee 2
            i32.const 15
            i32.gt_u
            br_if 0 (;@4;)
          end
        end
        local.get 2
        i32.const 8
        i32.ge_u
        if  ;; label = @3
          local.get 4
          local.get 3
          i64.load align=4
          i64.store align=4
          local.get 4
          i32.const 8
          i32.add
          local.set 4
          local.get 3
          i32.const 8
          i32.add
          local.set 3
        end
        local.get 2
        i32.const 4
        i32.and
        if  ;; label = @3
          local.get 4
          local.get 3
          i32.load
          i32.store
          local.get 4
          i32.const 4
          i32.add
          local.set 4
          local.get 3
          i32.const 4
          i32.add
          local.set 3
        end
        local.get 2
        i32.const 2
        i32.and
        if  ;; label = @3
          local.get 4
          local.get 3
          i32.load16_u align=1
          i32.store16 align=1
          local.get 4
          i32.const 2
          i32.add
          local.set 4
          local.get 3
          i32.const 2
          i32.add
          local.set 3
        end
        local.get 2
        i32.const 1
        i32.and
        i32.eqz
        br_if 1 (;@1;)
        local.get 4
        local.get 3
        i32.load8_u
        i32.store8
        local.get 0
        return
      end
      block  ;; label = @2
        block  ;; label = @3
          block (result i32)  ;; label = @4
            block  ;; label = @5
              local.get 5
              i32.const 32
              i32.ge_u
              if  ;; label = @6
                local.get 4
                local.get 3
                i32.load
                local.tee 1
                i32.store8
                block  ;; label = @7
                  block  ;; label = @8
                    local.get 2
                    i32.const 2
                    i32.sub
                    br_table 0 (;@8;) 1 (;@7;) 3 (;@5;)
                  end
                  local.get 4
                  local.get 1
                  i32.const 8
                  i32.shr_u
                  i32.store8 offset=1
                  local.get 4
                  local.get 3
                  i32.const 6
                  i32.add
                  i64.load align=2
                  i64.store offset=6 align=4
                  local.get 4
                  local.get 3
                  i32.load offset=4
                  i32.const 16
                  i32.shl
                  local.get 1
                  i32.const 16
                  i32.shr_u
                  i32.or
                  i32.store offset=2
                  local.get 3
                  i32.const 18
                  i32.add
                  local.set 1
                  i32.const 14
                  local.set 6
                  local.get 3
                  i32.const 14
                  i32.add
                  i32.load align=2
                  local.set 3
                  i32.const 14
                  local.set 5
                  local.get 4
                  i32.const 18
                  i32.add
                  br 3 (;@4;)
                end
                local.get 4
                local.get 3
                i32.const 5
                i32.add
                i64.load align=1
                i64.store offset=5 align=4
                local.get 4
                local.get 3
                i32.load offset=4
                i32.const 24
                i32.shl
                local.get 1
                i32.const 8
                i32.shr_u
                i32.or
                i32.store offset=1
                local.get 3
                i32.const 17
                i32.add
                local.set 1
                i32.const 13
                local.set 6
                local.get 3
                i32.const 13
                i32.add
                i32.load align=1
                local.set 3
                i32.const 15
                local.set 5
                local.get 4
                i32.const 17
                i32.add
                br 2 (;@4;)
              end
              block (result i32)  ;; label = @6
                local.get 5
                i32.const 16
                i32.lt_u
                if  ;; label = @7
                  local.get 4
                  local.set 2
                  local.get 3
                  br 1 (;@6;)
                end
                local.get 4
                local.get 3
                i32.load8_u
                i32.store8
                local.get 4
                local.get 3
                i32.load offset=1 align=1
                i32.store offset=1 align=1
                local.get 4
                local.get 3
                i64.load offset=5 align=1
                i64.store offset=5 align=1
                local.get 4
                local.get 3
                i32.load16_u offset=13 align=1
                i32.store16 offset=13 align=1
                local.get 4
                local.get 3
                i32.load8_u offset=15
                i32.store8 offset=15
                local.get 4
                i32.const 16
                i32.add
                local.set 2
                local.get 3
                i32.const 16
                i32.add
              end
              local.set 1
              local.get 5
              i32.const 8
              i32.and
              br_if 2 (;@3;)
              br 3 (;@2;)
            end
            local.get 4
            local.get 1
            i32.const 16
            i32.shr_u
            i32.store8 offset=2
            local.get 4
            local.get 1
            i32.const 8
            i32.shr_u
            i32.store8 offset=1
            local.get 4
            local.get 3
            i32.const 7
            i32.add
            i64.load align=1
            i64.store offset=7 align=4
            local.get 4
            local.get 3
            i32.load offset=4
            i32.const 8
            i32.shl
            local.get 1
            i32.const 24
            i32.shr_u
            i32.or
            i32.store offset=3
            local.get 3
            i32.const 19
            i32.add
            local.set 1
            i32.const 15
            local.set 6
            local.get 3
            i32.const 15
            i32.add
            i32.load align=1
            local.set 3
            i32.const 13
            local.set 5
            local.get 4
            i32.const 19
            i32.add
          end
          local.set 2
          local.get 4
          local.get 6
          i32.add
          local.get 3
          i32.store
        end
        local.get 2
        local.get 1
        i64.load align=1
        i64.store align=1
        local.get 2
        i32.const 8
        i32.add
        local.set 2
        local.get 1
        i32.const 8
        i32.add
        local.set 1
      end
      local.get 5
      i32.const 4
      i32.and
      if  ;; label = @2
        local.get 2
        local.get 1
        i32.load align=1
        i32.store align=1
        local.get 2
        i32.const 4
        i32.add
        local.set 2
        local.get 1
        i32.const 4
        i32.add
        local.set 1
      end
      local.get 5
      i32.const 2
      i32.and
      if  ;; label = @2
        local.get 2
        local.get 1
        i32.load16_u align=1
        i32.store16 align=1
        local.get 2
        i32.const 2
        i32.add
        local.set 2
        local.get 1
        i32.const 2
        i32.add
        local.set 1
      end
      local.get 5
      i32.const 1
      i32.and
      i32.eqz
      br_if 0 (;@1;)
      local.get 2
      local.get 1
      i32.load8_u
      i32.store8
    end
    local.get 0)
  (func (;78;) (type 1) (param i32 i32 i32) (result i32)
    (local i32 i32 i64 i32)
    local.get 2
    i32.const 33
    i32.ge_u
    if  ;; label = @1
      local.get 0
      local.get 1
      local.get 2
      memory.fill
      local.get 0
      return
    end
    block  ;; label = @1
      local.get 2
      i32.eqz
      br_if 0 (;@1;)
      local.get 0
      local.get 1
      i32.store8
      local.get 0
      local.get 2
      i32.add
      local.tee 3
      i32.const 1
      i32.sub
      local.get 1
      i32.store8
      local.get 2
      i32.const 3
      i32.lt_u
      br_if 0 (;@1;)
      local.get 0
      local.get 1
      i32.store8 offset=2
      local.get 0
      local.get 1
      i32.store8 offset=1
      local.get 3
      i32.const 3
      i32.sub
      local.get 1
      i32.store8
      local.get 3
      i32.const 2
      i32.sub
      local.get 1
      i32.store8
      local.get 2
      i32.const 7
      i32.lt_u
      br_if 0 (;@1;)
      local.get 0
      local.get 1
      i32.store8 offset=3
      local.get 3
      i32.const 4
      i32.sub
      local.get 1
      i32.store8
      local.get 2
      i32.const 9
      i32.lt_u
      br_if 0 (;@1;)
      local.get 0
      i32.const 0
      local.get 0
      i32.sub
      i32.const 3
      i32.and
      local.tee 6
      i32.add
      local.tee 4
      local.get 1
      i32.const 255
      i32.and
      i32.const 16843009
      i32.mul
      local.tee 3
      i32.store
      local.get 4
      local.get 2
      local.get 6
      i32.sub
      i32.const 60
      i32.and
      local.tee 2
      i32.add
      local.tee 1
      i32.const 4
      i32.sub
      local.get 3
      i32.store
      local.get 2
      i32.const 9
      i32.lt_u
      br_if 0 (;@1;)
      local.get 4
      local.get 3
      i32.store offset=8
      local.get 4
      local.get 3
      i32.store offset=4
      local.get 1
      i32.const 8
      i32.sub
      local.get 3
      i32.store
      local.get 1
      i32.const 12
      i32.sub
      local.get 3
      i32.store
      local.get 2
      i32.const 25
      i32.lt_u
      br_if 0 (;@1;)
      local.get 4
      local.get 3
      i32.store offset=24
      local.get 4
      local.get 3
      i32.store offset=20
      local.get 4
      local.get 3
      i32.store offset=16
      local.get 4
      local.get 3
      i32.store offset=12
      local.get 1
      i32.const 16
      i32.sub
      local.get 3
      i32.store
      local.get 1
      i32.const 20
      i32.sub
      local.get 3
      i32.store
      local.get 1
      i32.const 24
      i32.sub
      local.get 3
      i32.store
      local.get 1
      i32.const 28
      i32.sub
      local.get 3
      i32.store
      local.get 2
      local.get 4
      i32.const 4
      i32.and
      i32.const 24
      i32.or
      local.tee 2
      i32.sub
      local.tee 1
      i32.const 32
      i32.lt_u
      br_if 0 (;@1;)
      local.get 3
      i64.extend_i32_u
      i64.const 4294967297
      i64.mul
      local.set 5
      local.get 2
      local.get 4
      i32.add
      local.set 2
      loop  ;; label = @2
        local.get 2
        local.get 5
        i64.store offset=24
        local.get 2
        local.get 5
        i64.store offset=16
        local.get 2
        local.get 5
        i64.store offset=8
        local.get 2
        local.get 5
        i64.store
        local.get 2
        i32.const 32
        i32.add
        local.set 2
        local.get 1
        i32.const 32
        i32.sub
        local.tee 1
        i32.const 31
        i32.gt_u
        br_if 0 (;@2;)
      end
    end
    local.get 0)
  (func (;79;) (type 3) (param i32) (result i32)
    (local i32 i32 i32)
    block  ;; label = @1
      block  ;; label = @2
        local.get 0
        local.tee 1
        i32.const 3
        i32.and
        i32.eqz
        br_if 0 (;@2;)
        local.get 0
        i32.load8_u
        i32.eqz
        if  ;; label = @3
          i32.const 0
          return
        end
        local.get 0
        i32.const 1
        i32.add
        local.tee 1
        i32.const 3
        i32.and
        i32.eqz
        br_if 0 (;@2;)
        local.get 1
        i32.load8_u
        i32.eqz
        br_if 1 (;@1;)
        local.get 0
        i32.const 2
        i32.add
        local.tee 1
        i32.const 3
        i32.and
        i32.eqz
        br_if 0 (;@2;)
        local.get 1
        i32.load8_u
        i32.eqz
        br_if 1 (;@1;)
        local.get 0
        i32.const 3
        i32.add
        local.tee 1
        i32.const 3
        i32.and
        i32.eqz
        br_if 0 (;@2;)
        local.get 1
        i32.load8_u
        i32.eqz
        br_if 1 (;@1;)
        local.get 0
        i32.const 4
        i32.add
        local.tee 1
        i32.const 3
        i32.and
        br_if 1 (;@1;)
      end
      local.get 1
      i32.const 4
      i32.sub
      local.set 2
      local.get 1
      i32.const 5
      i32.sub
      local.set 1
      loop  ;; label = @2
        local.get 1
        i32.const 4
        i32.add
        local.set 1
        i32.const 16843008
        local.get 2
        i32.const 4
        i32.add
        local.tee 2
        i32.load
        local.tee 3
        i32.sub
        local.get 3
        i32.or
        i32.const -2139062144
        i32.and
        i32.const -2139062144
        i32.eq
        br_if 0 (;@2;)
      end
      loop  ;; label = @2
        local.get 1
        i32.const 1
        i32.add
        local.set 1
        local.get 2
        i32.load8_u
        local.set 3
        local.get 2
        i32.const 1
        i32.add
        local.set 2
        local.get 3
        br_if 0 (;@2;)
      end
    end
    local.get 1
    local.get 0
    i32.sub)
  (func (;80;) (type 0) (param i32 i32) (result i32)
    local.get 0
    local.get 1
    call 0
    i32.const 65535
    i32.and)
  (func (;81;) (type 0) (param i32 i32) (result i32)
    local.get 0
    local.get 1
    call 1
    i32.const 65535
    i32.and)
  (func (;82;) (type 0) (param i32 i32) (result i32)
    local.get 0
    local.get 1
    call 2
    i32.const 65535
    i32.and)
  (func (;83;) (type 0) (param i32 i32) (result i32)
    local.get 0
    local.get 1
    call 3
    i32.const 65535
    i32.and)
  (func (;84;) (type 0) (param i32 i32) (result i32)
    local.get 0
    local.get 1
    call 4
    i32.const 65535
    i32.and)
  (func (;85;) (type 12) (param i32 i64 i32) (result i32)
    local.get 0
    local.get 1
    local.get 2
    call 5
    i32.const 65535
    i32.and)
  (func (;86;) (type 7) (param i32 i64 i64 i32) (result i32)
    local.get 0
    local.get 1
    local.get 2
    local.get 3
    call 6
    i32.const 65535
    i32.and)
  (func (;87;) (type 8) (param i32 i64 i64) (result i32)
    local.get 0
    local.get 1
    local.get 2
    call 7
    i32.const 65535
    i32.and)
  (func (;88;) (type 3) (param i32) (result i32)
    local.get 0
    call 8
    i32.const 65535
    i32.and)
  (func (;89;) (type 3) (param i32) (result i32)
    local.get 0
    call 9
    i32.const 65535
    i32.and)
  (func (;90;) (type 0) (param i32 i32) (result i32)
    local.get 0
    local.get 1
    call 10
    i32.const 65535
    i32.and)
  (func (;91;) (type 0) (param i32 i32) (result i32)
    local.get 0
    local.get 1
    call 11
    i32.const 65535
    i32.and)
  (func (;92;) (type 8) (param i32 i64 i64) (result i32)
    local.get 0
    local.get 1
    local.get 2
    call 12
    i32.const 65535
    i32.and)
  (func (;93;) (type 0) (param i32 i32) (result i32)
    local.get 0
    local.get 1
    call 13
    i32.const 65535
    i32.and)
  (func (;94;) (type 13) (param i32 i64) (result i32)
    local.get 0
    local.get 1
    call 14
    i32.const 65535
    i32.and)
  (func (;95;) (type 7) (param i32 i64 i64 i32) (result i32)
    local.get 0
    local.get 1
    local.get 2
    local.get 3
    call 15
    i32.const 65535
    i32.and)
  (func (;96;) (type 5) (param i32 i32 i32 i64 i32) (result i32)
    local.get 0
    local.get 1
    local.get 2
    local.get 3
    local.get 4
    call 16
    i32.const 65535
    i32.and)
  (func (;97;) (type 0) (param i32 i32) (result i32)
    local.get 0
    local.get 1
    call 17
    i32.const 65535
    i32.and)
  (func (;98;) (type 1) (param i32 i32 i32) (result i32)
    local.get 0
    local.get 1
    local.get 2
    call 18
    i32.const 65535
    i32.and)
  (func (;99;) (type 5) (param i32 i32 i32 i64 i32) (result i32)
    local.get 0
    local.get 1
    local.get 2
    local.get 3
    local.get 4
    call 19
    i32.const 65535
    i32.and)
  (func (;100;) (type 2) (param i32 i32 i32 i32) (result i32)
    local.get 0
    local.get 1
    local.get 2
    local.get 3
    call 20
    i32.const 65535
    i32.and)
  (func (;101;) (type 5) (param i32 i32 i32 i64 i32) (result i32)
    local.get 0
    local.get 1
    local.get 2
    local.get 3
    local.get 4
    call 21
    i32.const 65535
    i32.and)
  (func (;102;) (type 0) (param i32 i32) (result i32)
    local.get 0
    local.get 1
    call 22
    i32.const 65535
    i32.and)
  (func (;103;) (type 14) (param i32 i64 i32 i32) (result i32)
    local.get 0
    local.get 1
    local.get 2
    local.get 3
    call 23
    i32.const 65535
    i32.and)
  (func (;104;) (type 3) (param i32) (result i32)
    local.get 0
    call 24
    i32.const 65535
    i32.and)
  (func (;105;) (type 0) (param i32 i32) (result i32)
    local.get 0
    local.get 1
    call 25
    i32.const 65535
    i32.and)
  (func (;106;) (type 2) (param i32 i32 i32 i32) (result i32)
    local.get 0
    local.get 1
    local.get 2
    local.get 3
    call 26
    i32.const 65535
    i32.and)
  (func (;107;) (type 0) (param i32 i32) (result i32)
    local.get 0
    local.get 1
    local.get 1
    call 79
    call 27
    i32.const 65535
    i32.and)
  (func (;108;) (type 2) (param i32 i32 i32 i32) (result i32)
    local.get 0
    local.get 1
    local.get 2
    local.get 2
    call 79
    local.get 3
    call 28
    i32.const 65535
    i32.and)
  (func (;109;) (type 22) (param i32 i32 i32 i64 i64 i32) (result i32)
    local.get 0
    local.get 1
    local.get 2
    local.get 2
    call 79
    local.get 3
    local.get 4
    local.get 5
    call 29
    i32.const 65535
    i32.and)
  (func (;110;) (type 6) (param i32 i32 i32 i32 i32) (result i32)
    local.get 0
    local.get 1
    local.get 2
    local.get 2
    call 79
    local.get 3
    local.get 4
    local.get 4
    call 79
    call 30
    i32.const 65535
    i32.and)
  (func (;111;) (type 23) (param i32 i32 i32 i32 i64 i64 i32 i32) (result i32)
    local.get 0
    local.get 1
    local.get 2
    local.get 2
    call 79
    local.get 3
    local.get 4
    local.get 5
    local.get 6
    local.get 7
    call 31
    i32.const 65535
    i32.and)
  (func (;112;) (type 6) (param i32 i32 i32 i32 i32) (result i32)
    local.get 0
    local.get 1
    local.get 1
    call 79
    local.get 2
    local.get 3
    local.get 4
    call 32
    i32.const 65535
    i32.and)
  (func (;113;) (type 0) (param i32 i32) (result i32)
    local.get 0
    local.get 1
    local.get 1
    call 79
    call 33
    i32.const 65535
    i32.and)
  (func (;114;) (type 2) (param i32 i32 i32 i32) (result i32)
    local.get 0
    local.get 1
    local.get 1
    call 79
    local.get 2
    local.get 3
    local.get 3
    call 79
    call 34
    i32.const 65535
    i32.and)
  (func (;115;) (type 1) (param i32 i32 i32) (result i32)
    local.get 0
    local.get 0
    call 79
    local.get 1
    local.get 2
    local.get 2
    call 79
    call 35
    i32.const 65535
    i32.and)
  (func (;116;) (type 0) (param i32 i32) (result i32)
    local.get 0
    local.get 1
    local.get 1
    call 79
    call 36
    i32.const 65535
    i32.and)
  (func (;117;) (type 2) (param i32 i32 i32 i32) (result i32)
    local.get 0
    local.get 1
    local.get 2
    local.get 3
    call 37
    i32.const 65535
    i32.and)
  (func (;118;) (type 4) (param i32)
    local.get 0
    call 38
    unreachable)
  (func (;119;) (type 15) (result i32)
    call 39
    i32.const 65535
    i32.and)
  (func (;120;) (type 0) (param i32 i32) (result i32)
    local.get 0
    local.get 1
    call 40
    i32.const 65535
    i32.and)
  (func (;121;) (type 1) (param i32 i32 i32) (result i32)
    local.get 0
    local.get 1
    local.get 2
    call 41
    i32.const 65535
    i32.and)
  (func (;122;) (type 9) (param i32 i32 i32 i32 i32 i32) (result i32)
    local.get 0
    local.get 1
    local.get 2
    local.get 3
    local.get 4
    local.get 5
    call 42
    i32.const 65535
    i32.and)
  (func (;123;) (type 6) (param i32 i32 i32 i32 i32) (result i32)
    local.get 0
    local.get 1
    local.get 2
    local.get 3
    local.get 4
    call 43
    i32.const 65535
    i32.and)
  (func (;124;) (type 0) (param i32 i32) (result i32)
    local.get 0
    local.get 1
    call 44
    i32.const 65535
    i32.and)
  (func (;125;) (type 4) (param i32)
    local.get 0
    call 118
    unreachable)
  (func (;126;) (type 4) (param i32)
    local.get 0
    call 125
    unreachable)
  (table (;0;) 1 1 funcref)
  (memory (;0;) 2)
  (global (;0;) (mut i32) (i32.const 67072))
  (global (;1;) i32 (i32.const 0))
  (global (;2;) i32 (i32.const 131072))
  (global (;3;) i32 (i32.const 67072))
  (global (;4;) i32 (i32.const 1528))
  (global (;5;) i32 (i32.const 1024))
  (global (;6;) i32 (i32.const 1532))
  (global (;7;) i32 (i32.const 1536))
  (global (;8;) i32 (i32.const 67072))
  (global (;9;) i32 (i32.const 1024))
  (global (;10;) i32 (i32.const 0))
  (global (;11;) i32 (i32.const 1))
  (export "memory" (memory 0))
  (export "__wasm_call_ctors" (func 45))
  (export "cabi_post_docs:adder/simple@0.1.0#concat" (func 46))
  (export "free" (func 66))
  (export "cabi_post_docs:adder/simple@0.1.0#reverse" (func 46))
  (export "cabi_post_docs:adder/simple@0.1.0#scale-points" (func 46))
  (export "cabi_realloc" (func 47))
  (export "realloc" (func 69))
  (export "abort" (func 75))
  (export "exports_docs_adder_simple_list_point_free" (func 46))
  (export "adder_string_set" (func 48))
  (export "strlen" (func 79))
  (export "adder_string_dup" (func 49))
  (export "memcpy" (func 77))
  (export "adder_string_free" (func 50))
  (export "docs:adder/simple@0.1.0#add-int" (func 51))
  (export "exports_docs_adder_simple_add_int" (func 51))
  (export "docs:adder/simple@0.1.0#add-str" (func 52))
  (export "exports_docs_adder_simple_add_str" (func 52))
  (export "docs:adder/simple@0.1.0#add-double" (func 53))
  (export "exports_docs_adder_simple_add_double" (func 53))
  (export "docs:adder/simple@0.1.0#concat" (func 54))
  (export "exports_docs_adder_simple_concat" (func 59))
  (export "docs:adder/simple@0.1.0#reverse" (func 55))
  (export "exports_docs_adder_simple_reverse" (func 60))
  (export "docs:adder/simple@0.1.0#add-point" (func 56))
  (export "exports_docs_adder_simple_add_point" (func 61))
  (export "docs:adder/simple@0.1.0#sub-point" (func 57))
  (export "exports_docs_adder_simple_sub_point" (func 62))
  (export "docs:adder/simple@0.1.0#scale-points" (func 58))
  (export "exports_docs_adder_simple_scale_points" (func 63))
  (export "__component_type_object_force_link_adder_public_use_in_this_compilation_unit" (func 45))
  (export "__component_type_object_force_link_adder" (func 45))
  (export "__indirect_function_table" (table 0))
  (export "malloc" (func 64))
  (export "__heap_end" (global 2))
  (export "__heap_base" (global 3))
  (export "errno" (global 4))
  (export "sbrk" (func 76))
  (export "calloc" (func 68))
  (export "memset" (func 78))
  (export "posix_memalign" (func 71))
  (export "aligned_alloc" (func 73))
  (export "malloc_usable_size" (func 74))
  (export "__libc_malloc" (func 64))
  (export "__libc_free" (func 66))
  (export "__libc_calloc" (func 68))
  (export "__tls_base" (global 1))
  (export "_Exit" (func 125))
  (export "_exit" (func 125))
  (export "__wasi_args_get" (func 80))
  (export "__wasi_args_sizes_get" (func 81))
  (export "__wasi_environ_get" (func 82))
  (export "__wasi_environ_sizes_get" (func 83))
  (export "__wasi_clock_res_get" (func 84))
  (export "__wasi_clock_time_get" (func 85))
  (export "__wasi_fd_advise" (func 86))
  (export "__wasi_fd_allocate" (func 87))
  (export "__wasi_fd_close" (func 88))
  (export "__wasi_fd_datasync" (func 89))
  (export "__wasi_fd_fdstat_get" (func 90))
  (export "__wasi_fd_fdstat_set_flags" (func 91))
  (export "__wasi_fd_fdstat_set_rights" (func 92))
  (export "__wasi_fd_filestat_get" (func 93))
  (export "__wasi_fd_filestat_set_size" (func 94))
  (export "__wasi_fd_filestat_set_times" (func 95))
  (export "__wasi_fd_pread" (func 96))
  (export "__wasi_fd_prestat_get" (func 97))
  (export "__wasi_fd_prestat_dir_name" (func 98))
  (export "__wasi_fd_pwrite" (func 99))
  (export "__wasi_fd_read" (func 100))
  (export "__wasi_fd_readdir" (func 101))
  (export "__wasi_fd_renumber" (func 102))
  (export "__wasi_fd_seek" (func 103))
  (export "__wasi_fd_sync" (func 104))
  (export "__wasi_fd_tell" (func 105))
  (export "__wasi_fd_write" (func 106))
  (export "__wasi_path_create_directory" (func 107))
  (export "__wasi_path_filestat_get" (func 108))
  (export "__wasi_path_filestat_set_times" (func 109))
  (export "__wasi_path_link" (func 110))
  (export "__wasi_path_open" (func 111))
  (export "__wasi_path_readlink" (func 112))
  (export "__wasi_path_remove_directory" (func 113))
  (export "__wasi_path_rename" (func 114))
  (export "__wasi_path_symlink" (func 115))
  (export "__wasi_path_unlink_file" (func 116))
  (export "__wasi_poll_oneoff" (func 117))
  (export "__wasi_proc_exit" (func 118))
  (export "__wasi_sched_yield" (func 119))
  (export "__wasi_random_get" (func 120))
  (export "__wasi_sock_accept" (func 121))
  (export "__wasi_sock_recv" (func 122))
  (export "__wasi_sock_send" (func 123))
  (export "__wasi_sock_shutdown" (func 124))
  (export "__funcs_on_exit" (func 45))
  (export "__wasm_call_dtors" (func 45))
  (export "__stdio_exit" (func 45))
  (export "exit" (func 126))
  (export "__dso_handle" (global 5))
  (export "__data_end" (global 6))
  (export "__stack_low" (global 7))
  (export "__stack_high" (global 8))
  (export "__global_base" (global 9))
  (export "__memory_base" (global 10))
  (export "__table_base" (global 11)))
