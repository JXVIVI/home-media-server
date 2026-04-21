# Home Streaming Server
A repo for a home streaming server

## Quick Notes
- qBittorrent for torrenting
- Jellyfin for the streaming server
- Uses protonvpn for torrenting
- Both qBittorrent and Jellyfin download to/look within /mnt/media-storage/media for storage
    - Where /mnt/media-storage/ is intended as the mount point for an external hard-drive
- Both qBittorrent and Jellyfin keep there config files within this repo and are gitignored
- Jellyfin should backup it's user config files to pCloud (stuff like accounts and watch lists)
- This repo will NOT work if ran from your directory (on linux at least) 
    - Put this in /srv/ - i.e. so the path to the repo root would be /srv/home-media-server
    - NOTE: This is an *absolute* path
- Important: For Jellyfin to properly recognise media and get correct metadata - tv shows and movies should be in *SEPARATE* Jellyfin libraries
    - Ie you should have a tv and movies directory within /mnt/media-storage/media
    - And media should go in their corresponding directory
- Note: you should rename example.env to .env and add the private key for wireguard (protonvpn)
    - For the private wireguard key, you can find it in vaultwarden or you can generate another on the protonvpn site
