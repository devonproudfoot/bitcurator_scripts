import shutil, os, argparse

def get_args():
    parser = argparse.ArgumentParser()
    parser.add_argument('accession')
    parser.add_argument('id')
    args = parser.parse_args()
    accession = args.accession.strip()
    id = args.id.strip()
    return accession, id

photographs = 'photographs'

accession, id = get_args()
new_path = os.path.join('/home/bcadmin/Desktop/pending_transfers', accession, id)

number = 0

for photograph in os.listdir(photographs):
    number = number + 1
    photo_path = os.path.join(photographs, photograph)
    new_file = 'media_photograph_' + str(number) + '.jpg'
    new_path = os.path.join('/home/bcadmin/Desktop/pending_transfers', accession, id, new_file)
    shutil.move(photo_path, new_path)
