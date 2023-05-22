module ApplicationHelper
    def default_meta_tags
        {
            site: '災害支援掲示板d-boards',
            title: '災害支援ボード',
            reverse: true,
            charset: 'utf-8',
            description: '福祉専門職の災害時支援ツールとしてチャットや記事の投稿ができるサイトです。会員の登録がなくても閲覧可能です',
            keywords: '災害' '福祉' '精神保健福祉士',
            canonical: request.original_url,
            separator: '|',
            icon: [
            { href: image_url('favicon.ico') },
            { href: image_url('icon.jpg'), rel: 'apple-touch-icon', sizes: '180x180', type: 'image/jpg' },
            ],
            og: {
            site_name: '災害支援掲示板d-boards', # もしくは site_name: :site
            title: '災害支援ボード', # もしくは title: :title
            description: '福祉専門職の災害時支援ツールとしてチャットや記事の投稿ができるサイトです。会員の登録がなくても閲覧可能です', # もしくは description: :description
            type: 'website',
            url: request.original_url,
            image: image_url('ogp.png'),
            locale: 'ja_JP',
            },
            twitter: {
            card: 'summary',
            site: '@clayfild4works',
            }
        }
        end

end
