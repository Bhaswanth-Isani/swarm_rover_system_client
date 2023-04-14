Swarm Rover System for Hotel Management

This project was made for hotels who have problems with the staff
shortage. These rovers can alleviate that issue by replacing servicing
staff members with these rovers to deliver food items and products
faster.

This project contains 2 app, a server and rovers -

- Client / User app - this helps them to order any item that is
  listed by the hotel easily from their room with just one click.

<img src="https://public.dm.files.1drv.com/y4mIkhIdggBTpNqkAr3AesTcNYMzHlu5eqLjvc7bQPWsK1GAJIRtv31b1gOBXt6IwG9xWWyznoA1_N6aYhYn4-5TRYSLra-yxkbP0Bk5jQZfrKgSUBVmzcGYdyHlTaIr5QXPioJDtunB5fLuRex6qzUn_2AUjg2wv1hJRdrerXk5IRBYQp7jtK4ovylxL_M_98I5fwmHylMyskc7gZ_u15Ah6b1uhuwC6yJQgld2HPlCR4?AVOverride=1" alt="alt text" title="image Title" width="290"/>
<img src="https://public.dm.files.1drv.com/y4mzfXc1bT5LdKuU3SUm05Zjq5KI1JEKB4VPpIWsUAj4yr9szl5ah3-6YICL4xii6Wftyb_DnL8moDJbrnIk2nb8EfE93uB6yOQHyC0uaATjCanUuuyVZLSInU5ydua-Y7hQNMBKFB_e5_795fVHkTePkf4SByF3kjTogdcME9k7Dvke3VOREaHITpUriz2riD3ARujphMtDnazdUh6B-cuEE7yRf2y6MlejqWU_OH-DXo?AVOverride=1" alt="alt text" title="image Title" width="290"/>

- Staff app - this app helps the staff of the hotel to keep track of
  any items that have been ordered by the user. [GitHub
  Repository](https://github.com/bhaswanth-isani8055/swarm_rover_system_staff)

<img src="https://public.dm.files.1drv.com/y4mJ6AKROJhXwlG3un6sLAJtX04YHuc2VA9ZNYxJFV6kMokjlcEtry4ySZXdFNbbCM2OqZ0tCFIobhTlqD4cDlJXTPJrSWk_nTqNVRcRRG7u4ZtVMAksY10-rneeOJ6ZRMXq2um4tLCi5rzr57wnPIa4oaAZMoICNGUYx-CX7rmQKPweo2c3rdJACA4793v5o-t0ETlldd2DjzK4cC54o95yzpEM8HMC5Vw-IuHu7yz4bY?AVOverride=1" alt="alt text" title="image Title" width="700"/>
<img src="https://public.dm.files.1drv.com/y4mI9I0EOIO1Ncvk5YdwdwnCNTXdTFDkQW9Pbu0XvMN8u_TPcCCfmElqwnb4Y1pYCuoQamwiX8xIvpAnXggGeyUtLUtZcj_NPAgYv9i4NdiZ4yJOpPUelEbmjO1SE5oMp6JmDMEw7iknhCKLeS3WJcwOBft2hBE-MEMcWcONWcCwnekg0SVhF75a9oAbiicpgrRFJPHQQSRBXprQF7LXlWRRSAftqBJSzT6bbPWK-23KOY?AVOverride=1" alt="alt text" title="image Title" width="700"/>
<img src="https://public.dm.files.1drv.com/y4melqhaIb-IQjiEbjLsGv96-Zs3kfx1i7hcvDJYFLxAV2FWu4rwU0LHCLD_6suklRYJpd9Re9heIJYB_0CAH67Gyg5hAWMzAQND4BigldmlkeKpoiwFaPVxCUwWmMXsFJYCWfFPhJWP7d_TRn3Rppmna2So5IPmvFjJqBy5RhCgRNwuLq0ZO6fQe_ffi6fMRdQaZaCZzfxDMSFtjJneMWoKb9ea27N_tbJMzlDKgkS96Q?AVOverride=1" alt="alt text" title="image Title" width="700"/>

- The server helps to keep the client and staff app in sync. The data
  is stored in Mongo DB. This also helps for communication between the
  rovers about the path they must follow using Web Sockets. [GitHub
  Repository](https://github.com/bhaswanth-isani8055/swarm-rover-system-server)

- These rovers are just a prototype just to deliver light payloads and
  transfer the orders between themselves. [Working Video](https://drive.google.com/file/d/1nQOgYQOsn2Hegxgd5K953B03Oj1xgUBO/view?usp=share_link)

<img src="https://public.dm.files.1drv.com/y4mENbRVURHdPbFcMZqaRKzDME_h_lsIS2RCwfwQGbwkMOWJTjCij3vktcx7YdKEGY7RfCmwOhAB5Ph9-qqu06Vogjr9cGo7bGDoOGTv0POCpd56Zkt1ygbnYcwPLKY4XX4LLG6pMqz6_bi8ts35BvhnFJlJWfYOU6inEJ0509iAWv51k5v1xvD8BuWs4sqN76QrzR5WulgMcJNQuMUfnCiT-NB8ZC71T5eNET-vZ6LPX8?AVOverride=1" alt="alt text" title="image Title" width="700"/>
<img src="https://public.dm.files.1drv.com/y4mzDNRpO-NkUyUjAYO7hjcG6lsV3N2x6IO74YRVXCRIB1zUGd0GI1DDF7RRPn2GwlUF7xw_XqNRFUMxMZW-sEM8Dz4vzxTneIMQXuWlyVWYGHs6o63irHbvI-LbaNo-Yo8MyY6W6J66OKSI6VjsPKhWFmNpehwhXBBzUpTQFhQsrSI-KMQfNbpIUSAFtfrsGkZ3d0he9ENXZAHY49yEZE3vvOPNm5yFErWaq44u5EDw7g?AVOverride=1" alt="alt text" title="image Title" width="700"/>
